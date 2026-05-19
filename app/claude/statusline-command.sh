#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract values from JSON
model=$(echo "$input" | jq -r '.model.display_name')
cwd=$(echo "$input" | jq -r '.workspace.current_dir')
project_dir=$(echo "$input" | jq -r '.workspace.project_dir')
session_name=$(echo "$input" | jq -r '.session_name // empty')
remaining_pct=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# Get git branch (skip optional locks for performance)
git_branch=""
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
    git_branch=$(git -C "$cwd" --no-optional-locks branch --show-current 2>/dev/null)
    if [ -z "$git_branch" ]; then
        git_branch=$(git -C "$cwd" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
    fi
fi

# Powerline-style separator
SEP=""

# Build status line
output=""

# Model segment (cyan bold)
if [ -n "$model" ]; then
    output="${output}$(printf '\033[36;1m')"
    output="${output} ${model} "
    output="${output}$(printf '\033[0m')"
fi

# Git branch segment (green bold)
if [ -n "$git_branch" ]; then
    if [ -n "$output" ]; then
        output="${output}$(printf '\033[90m')${SEP}$(printf '\033[0m')"
    fi
    output="${output}$(printf '\033[32;1m')"
    output="${output}  ${git_branch} "
    output="${output}$(printf '\033[0m')"
fi

# Directory segment (blue bold)
if [ -n "$cwd" ]; then
    display_dir="${cwd/#$HOME/~}"
    if [ -n "$output" ]; then
        output="${output}$(printf '\033[90m')${SEP}$(printf '\033[0m')"
    fi
    output="${output}$(printf '\033[34;1m')"
    output="${output}  ${display_dir} "
    output="${output}$(printf '\033[0m')"
fi

# Context percentage segment (yellow bold)
if [ -n "$remaining_pct" ]; then
    if [ -n "$output" ]; then
        output="${output}$(printf '\033[90m')${SEP}$(printf '\033[0m')"
    fi
    output="${output}$(printf '\033[33;1m')"
    output="${output} ctx:$(printf '%.0f' "$remaining_pct")% "
    output="${output}$(printf '\033[0m')"
fi

echo "$output"
