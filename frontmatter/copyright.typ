#import "../config.typ":*

#context{
if text.lang == "de"{
align(bottom)[Version 1.0.2 vom 2025-03-18\ // TODO how to generate Version and date automatically?
Dieses Werk steht unter der #link("https://creativecommons.org/licenses/by/4.0/deed.de")[Creative Commons Lizens (CC BY 4.0).]]
} 
else if text.lang == "en" {
align(bottom)[Version 1.0.2 from 2025-03-18\
This work is licensed under a #link("https://creativecommons.org/licenses/by/4.0/deed.en")[Creative Commons License (CC BY 4.0).]]
}
else {
  warning-to-set-lang
} 
}