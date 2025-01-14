@echo off

call ollama run qwen2.5:14b "Hello"
set start_time=%time%

call ollama run qwen2.5:14b "Write something about AI, 1000 tokens" > temp_output_14b.txt
call ollama run qwen2.5:14b "Write something about NVIDIA, 1000 tokens" >> temp_output_14b.txt
call ollama run qwen2.5:14b "Write something about AMD, 1000 tokens" >> temp_output_14b.txt
call ollama run qwen2.5:14b "Write something about INTEL, 1000 tokens" >> temp_output_14b.txt

set end_time=%time%

for /f "tokens=1-3 delims=:.," %%a in ("%end_time%") do set e_hh=%%a & set e_mm=%%b & set e_ss=%%c
for /f "tokens=1-3 delims=:.," %%a in ("%start_time%") do set s_hh=%%a & set s_mm=%%b & set s_ss=%%c

set /A e_hour=%e_hh%
set /A e_min=%e_mm%
set /A e_sec=%e_ss%

set /A s_hour=%s_hh%
set /A s_min=%s_mm%
set /A s_sec=%s_ss%

set /A total_seconds_end=e_hour*3600 + e_min*60 + e_sec
set /A total_seconds_start=s_hour*3600 + s_min*60 + s_sec

set /A duration=%total_seconds_end%-%total_seconds_start%

echo Ollama command "ollama run qwen2.5:14b" finished in %duration% seconds.

pause

call ollama run qwen2.5:7b "Hello"
set start_time=%time%

call ollama run qwen2.5:7b "Write something about AI, 1000 tokens" > temp_output_7b.txt
call ollama run qwen2.5:7b "Write something about NVIDIA, 1000 tokens" >> temp_output_7b.txt
call ollama run qwen2.5:7b "Write something about AMD, 1000 tokens" >> temp_output_7b.txt
call ollama run qwen2.5:7b "Write something about INTEL, 1000 tokens" >> temp_output_7b.txt

set end_time=%time%

for /f "tokens=1-3 delims=:.," %%a in ("%end_time%") do set e_hh=%%a & set e_mm=%%b & set e_ss=%%c
for /f "tokens=1-3 delims=:.," %%a in ("%start_time%") do set s_hh=%%a & set s_mm=%%b & set s_ss=%%c

set /A e_hour=%e_hh%
set /A e_min=%e_mm%
set /A e_sec=%e_ss%

set /A s_hour=%s_hh%
set /A s_min=%s_mm%
set /A s_sec=%s_ss%

set /A total_seconds_end=e_hour*3600 + e_min*60 + e_sec
set /A total_seconds_start=s_hour*3600 + s_min*60 + s_sec

set /A duration=%total_seconds_end%-%total_seconds_start%

echo Ollama command "ollama run qwen2.5:7b" finished in %duration% seconds.

pause

call ollama run qwen2.5:3b "Hello"
set start_time=%time%

call ollama run qwen2.5:3b "Write something about AI, 1000 tokens" > temp_output_3b.txt
call ollama run qwen2.5:3b "Write something about NVIDIA, 1000 tokens" >> temp_output_3b.txt
call ollama run qwen2.5:3b "Write something about AMD, 1000 tokens" >> temp_output_3b.txt
call ollama run qwen2.5:3b "Write something about INTEL, 1000 tokens" >> temp_output_3b.txt

set end_time=%time%

for /f "tokens=1-3 delims=:.," %%a in ("%end_time%") do set e_hh=%%a & set e_mm=%%b & set e_ss=%%c
for /f "tokens=1-3 delims=:.," %%a in ("%start_time%") do set s_hh=%%a & set s_mm=%%b & set s_ss=%%c

set /A e_hour=%e_hh%
set /A e_min=%e_mm%
set /A e_sec=%e_ss%

set /A s_hour=%s_hh%
set /A s_min=%s_mm%
set /A s_sec=%s_ss%

set /A total_seconds_end=e_hour*3600 + e_min*60 + e_sec
set /A total_seconds_start=s_hour*3600 + s_min*60 + s_sec

set /A duration=%total_seconds_end%-%total_seconds_start%

echo Ollama command "ollama run qwen2.5:3b" finished in %duration% seconds.

pause