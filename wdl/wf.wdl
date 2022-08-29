version 1.0

import "sub_wf.wdl" as one_two_three

workflow wf {

   input {
      File infile
      String ext
   }

   call one_two_three.sub_wf {
      input:
        infile = infile,
        ext = ext
   }

   call add_txt {
      input:
        infile = sub_wf.out,
        word = "Hello"
   }

   output {
      File text = add_txt.out
   }

}

task add_txt {

   input {
      File infile
      String word
   }

   String bn = basename(infile)

   command <<<
      echo ~{word} > ~{bn}.txt
   >>>

   output {
      File out = "~{bn}.txt"
   }

}

