version 1.0

# Run short R code that is not long enough to warrant writing a separate script
# note that the line spacing is important in the heredoc 

workflow test_r_code {
   call r_code{}
}

task r_code {

   input {
      String dataset
   }

   command <<<

      set -euo pipefail
      if [[ -x $(command -v Rscript) ]]; then
      Rscript --vanilla - <<CODE
         write.table(~{dataset}, "~{dataset}.tsv", quote = FALSE, sep="\t", col.names = FALSE, row.names = FALSE)
      CODE
      else
         touch women.tsv
      fi

   >>>

   output {
      File tsv = "~{dataset}.tsv"
   }

}

