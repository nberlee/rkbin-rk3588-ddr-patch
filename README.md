# README for DDR Binary Patching

## Context
We manually update the patched `rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.18.bin` to ensure security, the ddrbin_tool is only downloadable as a compiled executable.

This ELF executable is linked against the GNU C Library (glibc). As the Siderolabs Bldr environment is based on musl, the executable will not run in the bldr environment. Therefore we use a container image with the patched file.

## The Patch
The `ddrbin_tool` modifies specific variables in the DDR binary blob as outlined in the `ddrbin_param.txt` file located in the same directory. The current patch updates include:
- Changing the internal UART blade uart ID from 2 to 9.
- Modifying the baud rate from 1,500,000 to 115,200.

## Steps to Update the Binary
To update the DDR firmware binary, follow these steps:

1. **Download Required Tools and Files**:
   - Download the `ddrbin_tool` and the new DDR firmware from the Rockchip Linux GitHub repository: https://github.com/rockchip-linux/rkbin

2. **Run the Patching Tool**:
   - Execute the `ddrbin_tool` with the parameters file and the binary: 
     ```
     ddrbin_tool rk3588 ddrbin_param.txt rk3588_ddr_lp4_2112MHz_lp5_2400MHz_<version>.bin
     ```


Ensure to replace `<version>` with the specific version number of the DDR firmware you are working with.
