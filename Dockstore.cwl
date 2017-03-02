#!/usr/bin/env cwl-runner

class: CommandLineTool
id: "ADTEx"
label: "ADTEx workflow"
cwlVersion: v1.0

dct:creator:
  "@id": "jeltje"
  foaf:name: Jeltje van Baren
  foaf:mbox: "mailto:jeltje.van.baren@gmail.com"

requirements:
  - class: DockerRequirement
    dockerPull: "quay.io/ucsc_cgl/adtex"

baseCommand: ['-o', './', '--tostdout']

inputs:

  centromeres:
    type: File
    doc: "Centromere bed file"
    format: "http://edamontology.org/format_3003"
    inputBinding:
      prefix: -c

  targets:
    type: File
    doc: "Exome Targets bed file"
    format: "http://edamontology.org/format_3003"
    inputBinding:
      prefix: -b

  control_bam_input:
    type: File
    doc: "The control exome BAM file used as input, it must be sorted."
    format: "http://edamontology.org/format_2572"
    inputBinding:
      prefix: -n 

  tumor_bam_input:
    type: File
    doc: "The tumor exome BAM file used as input, it must be sorted."
    format: "http://edamontology.org/format_2572"
    inputBinding:
      prefix: -t 

  sample_id:
    type: string?
    default: myPatient
    doc: "sample ID to use in output"
    inputBinding:
      prefix: -s 


stdout: output.cnv

outputs: 
  output:
    type: stdout


