version 1.0

# Use `sub` to make replacements to a string.
# note that the file input into `sub` and the output section uses the path
# defined in the JSON input. The file path used in the command section uses the
# localised path. Using `basename` will strip the directory paths.

workflow sub_test {

   call echo {}

}

task echo {

   input {

      File fastq1
      File fastq2
      File fq1
      File fq2

   }

   # https://github.com/openwdl/wdl/blob/main/versions/1.0/SPEC.md#string-basenamestring
   # https://github.com/openwdl/wdl/blob/main/versions/1.0/SPEC.md#string-substring-string-string
   # input, pattern (regex), replacement
   # regex evaluation will depend on the execution engine running the WDL
   String fastq1_base = sub(basename(fastq1), "\\.f[ast]*q\\.gz$", "")
   String fastq2_base = sub(basename(fastq2), "\\.f[ast]*q\\.gz$", "")
   String fastq1_nobase = sub(fastq1, "\\.f[ast]*q\\.gz$", "")
   String fastq2_nobase = sub(fastq2, "\\.f[ast]*q\\.gz$", "")
   String fq1_base = sub(basename(fq1), "\\.f[ast]*q\\.gz$", "")
   String fq2_base = sub(basename(fq2), "\\.f[ast]*q\\.gz$", "")
   String fq1_nobase = sub(fq1, "\\.f[ast]*q\\.gz$", "")
   String fq2_nobase = sub(fq2, "\\.f[ast]*q\\.gz$", "")

   command <<<

      set -euo pipefail
      echo [~{fastq1}] [~{fastq2}] [~{fastq1_base}] [~{fastq2_base}] [~{fastq1_nobase}] [~{fastq2_nobase}]
      echo [~{fq1}] [~{fq2}] [~{fq1_base}] [~{fq2_base}] [~{fq1_nobase}] [~{fq2_nobase}]

   >>>

   output {

      String fastq = "[~{fastq1}] [~{fastq2}] [~{fastq1_base}] [~{fastq2_base}] [~{fastq1_nobase}] [~{fastq2_nobase}]"
      String fq = "[~{fq1}] [~{fq2}] [~{fq1_base}] [~{fq2_base}] [~{fq1_nobase}] [~{fq2_nobase}]"

   }

}

