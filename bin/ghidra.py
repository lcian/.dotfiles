#!/usr/bin/env python3
import os
import sys
import click
import subprocess
import select

GHIDRA_PATH = os.path.expanduser('~/lib/ghidra_10.3_PUBLIC/')

def shouldRun():
    click.secho('will run analysis in 3 seconds, press any key to cancel', fg='yellow')
    i, _, _ = select.select( [sys.stdin], [], [], 3 )

    if (i):
        return False
    else:
        return True

def run(filename):
    if os.path.isdir(filename):
        return os.system(f'{GHIDRA_PATH}ghidraRun')
    if '.gpr' in filename:
        os.system(f'{GHIDRA_PATH}ghidraRun "{os.path.abspath(filename)}"')
        return
   
    proj_file = filename + '.gpr'
    os.mkdir(os.path.join(os.path.dirname(filename), 'ghidra'))
    out_dir = os.path.join(os.path.dirname(filename), 'ghidra')

    proj_name = os.path.splitext(os.path.basename(proj_file))[0]
    file_output = subprocess.check_output(f'file "{filename}"', shell=True).decode('utf8')
    click.secho(file_output, fg='yellow')
    os.system(f'checksec --file={filename}')
    print()
    r = shouldRun()
    if r:
        click.secho(f'running analysis on ', fg='green', nl=False)
        click.secho(click.style(f'./{os.path.basename(filename)}', bold=True), fg='green')
        os.system(f'{GHIDRA_PATH}support/analyzeHeadless {out_dir} "{proj_name}" -import "{filename}" > /dev/null 2>&1')
        os.system(f'{GHIDRA_PATH}ghidraRun "{os.path.join(out_dir, os.path.basename(proj_file))}" > /dev/null 2>&1')


if __name__ == '__main__':
    from sys import argv
    cwd = argv[1]
    PROJECT_DIRECTORY = os.path.join(cwd, '/.ghidra')
    file_names = os.listdir(argv[1])
    for file_name in file_names:
        if file_name.endswith("_patched"):
            run(os.path.join(cwd, file_name))
            exit(0)
            
