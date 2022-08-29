version 1.0

workflow sub_wf {

   input {
      File infile
      String ext
   }

   call add_ext as one {
      input:
        infile = infile,
        ext = ext
   }

   call add_ext as two {
      input:
        infile = one.out,
        ext = "two"
   }

   call add_ext as three {
      input:
        infile = two.out,
        ext = "three"
   }

   output {
      File out = three.out
   }

}

task add_ext {

   input {
      File infile
      String ext
   }

   String bn = basename(infile)

   command <<<
      cp ~{infile} ~{bn}.~{ext}
   >>>

   output {
      File out = "~{bn}.~{ext}"
   }

}

