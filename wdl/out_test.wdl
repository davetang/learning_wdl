version 1.0

# optional output files are permitted in WDL

workflow out_test {
   call touch
}

task touch {

   input {

      String file
      String? opt
      String? opt2

   }

   command <<<

      set -euo pipefail
      touch ~{file}
      # `else` needs to be included with `if` even if it does nothing
      ~{if defined(opt) then "echo ~{opt} > add.txt" else ""}
      ~{if defined(opt2) then "echo ~{opt2} > ~{opt2}.txt" else ""}

   >>>

   output {

      File outfile = "~{file}"
      File? opt_outfile = "add.txt"
      File? opt2_outfile = "~{opt2}.txt"

   }

}

