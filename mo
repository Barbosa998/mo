<!DOCTYPE html>
<html lang="pt-BR" class="scroll-smooth">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quebra-cabeça do Amor</title>
    
    <!-- Tailwind CSS para um design moderno e responsivo -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Google Fonts para fontes elegantes -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Inter:wght@300;400&display=swap" rel="stylesheet">
    
    <style>
        /* Estilos personalizados */
        body {
            font-family: 'Inter', sans-serif;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        h1, h2, h3 {
            font-family: 'Playfair Display', serif;
        }

        /* Efeito de Glassmorphism */
        .glassmorphism {
            background: rgba(255, 255, 255, 0.25);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
        }
        
        /* Gradiente de fundo romântico */
        .romantic-gradient {
            background: linear-gradient(135deg, #fdf2f8 0%, #fce7f3 25%, #fbcfe8 50%, #f9a8d4 75%, #f472b6 100%);
        }

        /* Animações */
        .fade-in {
            animation: fadeIn 1s ease-out forwards;
        }

        .fade-in-up {
            animation: fadeInUp 1s ease-out forwards;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Estilo do quebra-cabeça */
        .puzzle-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            grid-template-rows: repeat(3, 1fr);
            gap: 2px;
            width: 300px;
            height: 300px;
            margin: 0 auto;
            background: #fff;
            border-radius: 12px;
            padding: 4px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        .puzzle-piece {
            background-size: 300px 300px;
            background-repeat: no-repeat;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            border: 2px solid transparent;
        }

        .puzzle-piece:hover {
            transform: scale(1.05);
            border-color: #f472b6;
            box-shadow: 0 4px 12px rgba(244, 114, 182, 0.3);
        }

        .puzzle-piece.empty {
            background: linear-gradient(45deg, #fce7f3, #fbcfe8);
            border: 2px dashed #f472b6;
        }

        /* Animação de coração pulsante */
        .heart-pulse {
            animation: heartPulse 1.5s ease-in-out infinite;
        }

        @keyframes heartPulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }

        /* Esconder barra de rolagem */
        .lyrics-container::-webkit-scrollbar { display: none; }
        .lyrics-container { -ms-overflow-style: none; scrollbar-width: none; }

        /* Efeito de celebração */
        .celebration {
            animation: celebration 0.6s ease-out;
        }

        @keyframes celebration {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        /* Botão hover */
        .btn-hover {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .btn-hover:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }
    </style>
</head>
<body class="romantic-gradient text-gray-800 overflow-x-hidden">

    <!-- MÚSICA DE FUNDO -->
    <audio id="golden_hour" loop>
        <source src="https://github.com/thefelipejs/assets-cdn/raw/main/golden-hour.mp3" type="audio/mpeg">
        Seu navegador não suporta o elemento de áudio.
    </audio>

    <!-- TELA DO QUEBRA-CABEÇA -->
    <section id="puzzle-section" class="min-h-screen w-screen flex items-center justify-center py-8 px-4">
        <div class="w-full max-w-4xl mx-auto text-center">
            
            <!-- Título -->
            <div class="mb-8 fade-in-up">
                <div class="heart-pulse text-4xl mb-4">💖</div>
                <h1 class="text-3xl md:text-5xl text-rose-800 mb-4 font-bold">
                    Monte nosso quebra-cabeça do amor
                </h1>
                <p class="text-lg text-rose-600 mb-6">
                    Clique nas peças para trocar de posição e revelar nossa foto especial
                </p>
            </div>

            <!-- Container do quebra-cabeça -->
            <div class="glassmorphism rounded-3xl p-8 mb-8 inline-block">
                <div id="puzzle-container" class="puzzle-container">
                    <!-- As peças serão geradas dinamicamente pelo JavaScript -->
                </div>
                
                <!-- Botão de embaralhar -->
                <button id="shuffle-btn" class="mt-6 bg-gradient-to-r from-rose-500 to-pink-500 text-white px-6 py-3 rounded-full font-semibold btn-hover focus:outline-none focus:ring-4 focus:ring-rose-200">
                    🎲 Embaralhar Novamente
                </button>
            </div>

            <!-- Dica -->
            <div class="glassmorphism rounded-2xl p-4 max-w-md mx-auto">
                <p class="text-rose-700 text-sm">
                    💡 <strong>Dica:</strong> Clique em duas peças para trocá-las de lugar
                </p>
            </div>
        </div>
    </section>

    <!-- TELA DA SURPRESA (aparece após completar o quebra-cabeça) -->
    <section id="surprise-section" class="min-h-screen w-screen flex items-center justify-center py-16 px-4 opacity-0 transition-all duration-1000 transform translate-y-full absolute top-0 left-0">
        <div class="w-full max-w-6xl mx-auto">
            <div class="glassmorphism rounded-3xl shadow-2xl p-6 md:p-10 grid grid-cols-1 lg:grid-cols-2 gap-8">
                
                <!-- COLUNA DA IMAGEM E CONTROLES DE MÚSICA -->
                <div class="flex flex-col items-center space-y-6">
                    <!-- Imagem do casal com efeito de fade-in -->
                    <div class="relative group">
                        <img id="completed-photo" 
                             src="couple_photo.jpeg" 
                             onerror="this.onerror=null;this.src='https://placehold.co/600x600/fecdd3/9f1239?text=Nossa+Foto+Aqui';"
                             alt="Nossa foto especial" 
                             class="rounded-2xl w-full max-w-md h-auto object-cover shadow-lg transition-transform duration-300 group-hover:scale-105 opacity-0 fade-in">
                        
                        <!-- Overlay com efeito glassmorphism -->
                        <div class="absolute inset-0 rounded-2xl bg-gradient-to-t from-black/20 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300"></div>
                    </div>
                    
                    <!-- Controles de música -->
                    <div class="glassmorphism rounded-2xl p-4 flex items-center space-x-4">
                        <button id="play-pause-btn" class="bg-gradient-to-r from-rose-500 to-pink-500 text-white rounded-full p-3 shadow-lg btn-hover focus:outline-none focus:ring-4 focus:ring-rose-200">
                            <svg id="play-icon" class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M6.3 2.841A1.5 1.5 0 004 4.11V15.89a1.5 1.5 0 002.3 1.269l9.344-5.89a1.5 1.5 0 000-2.538L6.3 2.841z"></path>
                            </svg>
                            <svg id="pause-icon" class="w-6 h-6 hidden" fill="currentColor" viewBox="0 0 20 20">
                                <path d="M5.75 4.5a.75.75 0 00-.75.75v10.5a.75.75 0 001.5 0V5.25a.75.75 0 00-.75-.75zM14.25 4.5a.75.75 0 00-.75.75v10.5a.75.75 0 001.5 0V5.25a.75.75 0 00-.75-.75z"></path>
                            </svg>
                        </button>
                        <div class="flex flex-col">
                            <span class="text-rose-700 font-semibold text-sm">Golden Hour</span>
                            <span class="text-rose-500 text-xs">JVKE</span>
                        </div>
                    </div>
                </div>

                <!-- COLUNA DO CONTEÚDO -->
                <div class="flex flex-col space-y-6">
                    <!-- Parabéns -->
                    <div class="glassmorphism rounded-2xl p-6 text-center celebration">
                        <h2 class="text-2xl font-bold text-rose-900 mb-4">🎉 Parabéns! 🎉</h2>
                        <p class="text-rose-700 text-base mb-4">
                            Você conseguiu montar nosso quebra-cabeça do amor!
                        </p>
                    </div>

                    <!-- Dedicatória romântica -->
                    <div class="glassmorphism rounded-2xl p-6 text-center">
                        <h3 class="text-xl font-bold text-rose-900 mb-4">Meu Amor,</h3>
                        <p class="text-rose-800 text-base leading-relaxed">
                            Você é o meu verso mais bonito, minha paz em dias difíceis e minha alegria em todos os momentos. 
                            Obrigado por existir. Essa surpresa é só um reflexo do quanto te amo.
                        </p>
                        <div class="mt-4 text-2xl">💕</div>
                    </div>
                    
                    <!-- Container da letra da música -->
                    <div class="glassmorphism rounded-2xl p-6">
                        <h4 class="font-bold text-lg text-rose-800 mb-4 text-center flex items-center justify-center">
                            <span class="mr-2">🎵</span>
                            Golden Hour
                        </h4>
                        <div id="lyrics-scroller" class="lyrics-container h-64 overflow-y-auto p-4 bg-white/30 rounded-xl">
                            <div id="lyrics-content" class="text-sm text-gray-700 leading-relaxed whitespace-pre-line">
                                Carregando letra da música...
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // --- SELETORES DE ELEMENTOS ---
            const puzzleContainer = document.getElementById('puzzle-container');
            const shuffleBtn = document.getElementById('shuffle-btn');
            const puzzleSection = document.getElementById('puzzle-section');
            const surpriseSection = document.getElementById('surprise-section');
            const completedPhoto = document.getElementById('completed-photo');
            const audio = document.getElementById('background-music');
            const playPauseBtn = document.getElementById('play-pause-btn');
            const playIcon = document.getElementById('play-icon');
            const pauseIcon = document.getElementById('pause-icon');
            const lyricsScroller = document.getElementById('lyrics-scroller');
            const lyricsContent = document.getElementById('lyrics-content');

            let isPlaying = false;
            let lyricsScrollInterval;
            let selectedPiece = null;
            let puzzlePieces = [];
            let correctOrder = [0, 1, 2, 3, 4, 5, 6, 7, 8];
            let currentOrder = [...correctOrder];
            
            // --- LETRA DA MÚSICA ---
            const lyricsText = `It was just two lovers
Sittin' in the car, listening to Blonde
Fallin' for each other
Pink and orange skies, feelin' super childish
No Donald Glover
Missed call from my mother
Like, "Where you at tonight?"
Got no alibi

I was all alone with the love of my life
She's got glitter for skin
My radiant beam in the night
I don't need no light to see you shine
It's your golden hour
You slow down time
In your golden hour

We were just two lovers
Feet up on the dash, drivin' nowhere fast
Burnin' through the summer
Radio on blast, make the moment last
She got solar power
Minutes feel like hours
She knew she was the baddest, can you even imagine
Fallin' like I did?

For the love of my life
She's got glitter for skin
My radiant beam in the night
I don't need no light to see you shine
It's your golden hour
You slow down time
In your golden hour`;

            // --- FUNÇÕES DO QUEBRA-CABEÇA ---
            function createPuzzlePieces() {
                puzzleContainer.innerHTML = '';
                puzzlePieces = [];
                
                for (let i = 0; i < 9; i++) {
                    const piece = document.createElement('div');
                    piece.className = 'puzzle-piece';
                    piece.dataset.index = i;
                    piece.dataset.correctPosition = i;
                    
                    // Calcula a posição da imagem de fundo
                    const row = Math.floor(i % 3);
                    const col = Math.floor(i / 3);
                    const bgPosX = -row * 100;
                    const bgPosY = -col * 100;
                    
                    piece.style.backgroundImage = 'url(couple_photo.jpeg)';
                    piece.style.backgroundPosition = `${bgPosX}px ${bgPosY}px`;
                    
                    piece.addEventListener('click', () => selectPiece(piece, i));
                    
                    puzzleContainer.appendChild(piece);
                    puzzlePieces.push(piece);
                }
            }

            function shufflePuzzle() {
                // Embaralha a ordem das peças
                for (let i = currentOrder.length - 1; i > 0; i--) {
                    const j = Math.floor(Math.random() * (i + 1));
                    [currentOrder[i], currentOrder[j]] = [currentOrder[j], currentOrder[i]];
                }
                
                // Aplica a nova ordem
                updatePuzzleDisplay();
                selectedPiece = null;
                clearSelection();
            }

            function updatePuzzleDisplay() {
                currentOrder.forEach((correctPos, currentPos) => {
                    const piece = puzzlePieces[currentPos];
                    const row = Math.floor(correctPos % 3);
                    const col = Math.floor(correctPos / 3);
                    const bgPosX = -row * 100;
                    const bgPosY = -col * 100;
                    
                    piece.style.backgroundPosition = `${bgPosX}px ${bgPosY}px`;
                    piece.dataset.correctPosition = correctPos;
                });
            }

            function selectPiece(piece, index) {
                if (selectedPiece === null) {
                    // Primeira peça selecionada
                    selectedPiece = index;
                    piece.style.border = '3px solid #f472b6';
                    piece.style.transform = 'scale(1.05)';
                } else if (selectedPiece === index) {
                    // Deseleciona a mesma peça
                    clearSelection();
                } else {
                    // Segunda peça selecionada - troca as posições
                    swapPieces(selectedPiece, index);
                    clearSelection();
                    
                    // Verifica se o quebra-cabeça foi completado
                    setTimeout(checkCompletion, 300);
                }
            }

            function swapPieces(index1, index2) {
                [currentOrder[index1], currentOrder[index2]] = [currentOrder[index2], currentOrder[index1]];
                updatePuzzleDisplay();
            }

            function clearSelection() {
                selectedPiece = null;
                puzzlePieces.forEach(piece => {
                    piece.style.border = '2px solid transparent';
                    piece.style.transform = 'scale(1)';
                });
            }

            function checkCompletion() {
                const isCompleted = currentOrder.every((pos, index) => pos === index);
                
                if (isCompleted) {
                    setTimeout(() => {
                        showSurprise();
                    }, 500);
                }
            }

            function showSurprise() {
                // Transição para a tela de surpresa
                puzzleSection.style.opacity = '0';
                puzzleSection.style.transform = 'translateY(-100%)';
                
                setTimeout(() => {
                    puzzleSection.style.display = 'none';
                    surpriseSection.style.position = 'relative';
                    surpriseSection.style.opacity = '1';
                    surpriseSection.style.transform = 'translateY(0)';
                    
                    // Mostra a imagem com efeito fade-in
                    setTimeout(() => {
                        completedPhoto.style.opacity = '1';
                    }, 500);
                    
                    // Carrega a letra da música
                    lyricsContent.textContent = lyricsText;
                    
                    // Inicia a música automaticamente
                    setTimeout(() => {
                        if (!isPlaying) {
                            togglePlay();
                        }
                    }, 1000);
                }, 1000);
            }

            // --- FUNÇÕES DE MÚSICA ---
            function startLyricsScroll() {
                if (lyricsScrollInterval) clearInterval(lyricsScrollInterval);
                lyricsScroller.scrollTop = 0;
                lyricsScrollInterval = setInterval(() => {
                    if (lyricsScroller.scrollTop + lyricsScroller.clientHeight >= lyricsScroller.scrollHeight - 5) {
                        clearInterval(lyricsScrollInterval);
                    } else {
                        lyricsScroller.scrollTop += 1;
                    }
                }, 150);
            }

            function stopLyricsScroll() {
                clearInterval(lyricsScrollInterval);
            }
            
            function togglePlay() {
                if (isPlaying) {
                    audio.pause();
                    stopLyricsScroll();
                    playIcon.classList.remove('hidden');
                    pauseIcon.classList.add('hidden');
                } else {
                    audio.play().then(() => {
                        startLyricsScroll();
                        playIcon.classList.add('hidden');
                        pauseIcon.classList.remove('hidden');
                    }).catch(error => {
                        console.error("Erro ao tocar música:", error);
                        startLyricsScroll();
                        playIcon.classList.add('hidden');
                        pauseIcon.classList.remove('hidden');
                    });
                }
                isPlaying = !isPlaying;
            }

            // --- EVENTOS ---
            shuffleBtn.addEventListener('click', shufflePuzzle);
            playPauseBtn.addEventListener('click', togglePlay);

            // --- INICIALIZAÇÃO ---
            createPuzzlePieces();
            shufflePuzzle();
        });
    </script>
</body>
</html>

