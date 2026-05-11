# Video-Caption-Tool

A simple Windows tool that burns SRT subtitle files into video files as hardcoded, TikTok/Reels-style captions — producing ready-to-post MP4s.

## What It Does

Drop your `.mov` video files alongside their matching `.srt` files, run `BurnCaptions.bat`, and get back captioned `.mp4` files in a `Captioned Renders\` subfolder. No timeline editing, no manual subtitle alignment — just rendered output ready to upload.

## Requirements

- Windows
- Python installed (`py` available on PATH)
- `burn_captions.py` in the same folder as `BurnCaptions.bat`
- FFmpeg (used by the Python script)

## Setup

1. Clone or download this repo
2. Place `BurnCaptions.bat` and `burn_captions.py` in the same folder
3. Drop your video and SRT files into that folder

## Usage

### Option 1 — Process the whole folder

Double-click `BurnCaptions.bat`. It finds all `.mov` + `.srt` pairs in the same folder and processes them all.

### Option 2 — Drag and drop

Drag one or more `.mov` files directly onto `BurnCaptions.bat`. It processes the folder(s) containing those files.

## Output

Captioned files are saved to a `Captioned Renders\` subfolder alongside your source files, named `{original_filename}_captioned.mp4`.

## File Naming

Your video and SRT must share the same base filename:

```
my_video.mov
my_video.srt
→ Captioned Renders\my_video_captioned.mp4
```

## Notes

- Source files are not modified
- Captions are hardcoded (burned in) — not a separate subtitle track
- Handles batches automatically; no need to run it once per file
