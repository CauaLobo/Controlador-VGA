# Projeto: Controlador VGA em Verilog

Este repositório contém um projeto em Verilog desenvolvido no ambiente Quartus II, com foco na implementação de um controlador VGA utilizando a placa DE10-Lite. O objetivo é gerar sinais compatíveis com um monitor VGA, permitindo exibir informações gráficas na tela com base nas entradas configuradas. O projeto aborda conceitos de temporização de sinais VGA, controle de cor e geração de sincronismo horizontal e vertical.

## Estrutura do Projeto

A pasta principal do projeto contém os seguintes arquivos relevantes:

### Arquivos Verilog (`.v`):

- `main_vga.v` — Módulo principal que integra todo o funcionamento do controlador VGA. Faz a interconexão e controle dos demais módulos, incluindo geradores de sincronismo, controle de cor e lógica de vídeo.

- `rgb_control.v` — Responsável pelo controle das cores (RGB) que serão exibidas na tela, com base nas chaves de entrada.

- `video_on_logic.v` — Implementa a lógica de ativação da área visível do vídeo, determinando quando os sinais RGB devem ser enviados.

- `divisor_clock2.v` — Módulo divisor de clock, responsável por gerar a frequência adequada para o sinal VGA a partir do clock principal da FPGA.

- `jk_ff_flipflop.v` — Flip-flop JK utilizado para controle de estados internos, como nos contadores.

- `contador_JK.v` — Contador síncrono implementado com flip-flops JK, utilizado para contar pixels ou linhas.

- `comparador_on_h.v` — Comparador utilizado para gerar o sinal de sincronismo horizontal (HSYNC).

- `comparador_on_v.v` — Comparador utilizado para gerar o sinal de sincronismo vertical (VSYNC).

- `comparador_igual_524.v` — Detecta o fim de uma linha (524 contagens horizontais).

- `comparador_igual_799.v` — Detecta o fim de um quadro (799 linhas).

- `comparador_menor_2.v` — Comparador auxiliar utilizado na lógica de controle.

- `subtrator_10bit.v` — Módulo subtrator, utilizado para cálculos de posição e controle.

---

