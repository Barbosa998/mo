# Site Romântico - Instruções de Personalização

## 📁 Estrutura do Projeto

```
romantic_website/
├── index.html          # Página principal com duas opções
├── puzzle.html         # Página do quebra-cabeça (opcional)
└── README.md          # Este arquivo
```

## 🎵 Como Adicionar a Música "Golden Hour"

1. **Baixe o arquivo de música** em formato MP3
2. **Renomeie o arquivo** para `golden_hour.mp3`
3. **Coloque o arquivo** na pasta `romantic_website/`
4. **Edite o arquivo `index.html`** e substitua a linha:
   ```html
   <source src="https://www.soundjay.com/misc/sounds/bell-ringing-05.wav" type="audio/wav">
   ```
   Por:
   ```html
   <source src="golden_hour.mp3" type="audio/mpeg">
   ```

## 📸 Como Adicionar Sua Foto

1. **Prepare sua foto** (formatos: JPG, PNG, WebP)
2. **Renomeie o arquivo** para `nossa_foto.jpg` (ou .png/.webp)
3. **Coloque o arquivo** na pasta `romantic_website/`
4. **Edite o arquivo `index.html`** e substitua a linha que contém:
   ```html
   <img id="couple-image" src="data:image/svg+xml;base64,..."
   ```
   Por:
   ```html
   <img id="couple-image" src="nossa_foto.jpg" alt="Nossa Foto" class="rounded-lg shadow-lg max-w-full h-auto">
   ```

## ✏️ Como Personalizar a Mensagem

No arquivo `index.html`, encontre a seção da dedicatória e edite o texto:

```html
<p class="text-rose-700 text-lg leading-relaxed">
    Amor, você é o meu verso mais bonito, minha paz em dias difíceis e minha alegria em todos os momentos. 
    Obrigado por existir. Essa surpresa é só um reflexo do quanto te amo. 
    Cada dia ao seu lado é um presente, e cada sorriso seu ilumina meu mundo. 
    Você é minha inspiração, minha força e minha felicidade. Te amo infinitamente! 💖
</p>
```

## 🎶 Como Personalizar a Letra da Música

No arquivo `index.html`, encontre a seção `lyrics-text` e substitua pela letra completa da música:

```html
<div id="lyrics-text" class="lyrics-scroll">
    <p class="mb-4">Sua letra aqui...</p>
    <p class="mb-4">Mais versos...</p>
    <!-- Continue adicionando os versos -->
</div>
```

## 🎨 Como Personalizar as Cores

Para alterar o esquema de cores, edite as classes do Tailwind CSS:

- **Rosa**: `rose-100`, `rose-500`, `rose-800`
- **Roxo**: `purple-100`, `purple-500`, `purple-600`
- **Verde**: `green-200`, `green-600`

Exemplo de mudança para azul:
- Substitua `rose-` por `blue-`
- Substitua `pink-` por `sky-`

## 🚀 Como Usar o Site

### Opção 1: Visualização Direta
1. Abra `index.html` no navegador
2. Clique ou deslize para continuar
3. Escolha "Ver Diretamente"
4. Aproveite a surpresa!

### Opção 2: Com Quebra-cabeça
1. Abra `index.html` no navegador
2. Clique ou deslize para continuar
3. Escolha "Quebra-cabeça Primeiro"
4. Monte o quebra-cabeça clicando nas peças em ordem (1-9)
5. Após completar, clique em "Revelar a Surpresa"

## 📱 Recursos Incluídos

- ✅ **Design responsivo** (funciona em celular e desktop)
- ✅ **Animações suaves** com transições elegantes
- ✅ **Efeito glassmorphism** nos cards
- ✅ **Partículas de coração** animadas
- ✅ **Controles de música** (play/pause)
- ✅ **Quebra-cabeça interativo** (3x3)
- ✅ **Detecção de gestos** (swipe no mobile)
- ✅ **Fontes elegantes** (Playfair Display + Inter)
- ✅ **Cores românticas** (rosa, roxo, branco)

## 🔧 Personalização Avançada

### Alterar Animações
- Modifique as durações em `@keyframes`
- Ajuste os `transition` e `animation` no CSS

### Adicionar Mais Efeitos
- Inclua mais partículas
- Adicione novos tipos de animação
- Implemente efeitos de hover personalizados

### Modificar o Quebra-cabeça
- Altere o tamanho da grade (ex: 4x4 em vez de 3x3)
- Mude as cores das peças
- Adicione imagens nas peças em vez de números

## 💡 Dicas Importantes

1. **Teste sempre** no navegador após fazer alterações
2. **Mantenha backups** dos arquivos originais
3. **Use imagens otimizadas** para carregamento rápido
4. **Teste em diferentes dispositivos** (celular/desktop)
5. **Verifique se a música funciona** em diferentes navegadores

## ❤️ Aproveite sua Surpresa Romântica!

Este site foi criado com muito carinho para proporcionar um momento especial. Personalize-o como desejar e crie uma experiência única e inesquecível! 💕

