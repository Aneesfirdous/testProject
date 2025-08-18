<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Memory Booster Tool</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: url('images/memory_bg.jpg') no-repeat center center/cover;
            color: #333;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            position: relative;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            position: relative; /* Needed for absolute positioning of dashboard button */
            padding-bottom: 80px; /* Add space for the button at the bottom */
        }
        .logout-container {
            position: absolute;
            top: 20px;
            right: 20px;
            z-index: 10;
        }
        h1, h2 {
            color: #2c3e50;
            margin-bottom: 20px;
        }
        p {
            color: #7f8c8d;
        }
        .flashcard-container {
            border: 1px solid #bdc3c7;
            border-radius: 8px;
            padding: 20px;
            min-height: 150px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
            background-color: #ecf0f1;
            transition: transform 0.3s ease-in-out;
        }
        .flashcard-container:hover {
            transform: scale(1.02);
        }
        #term-display {
            font-size: 24px;
            font-weight: bold;
            color: #34495e;
            margin-bottom: 10px;
        }
        #definition-display {
            font-size: 18px;
            color: #2980b9;
            margin-top: 10px;
            display: none;
        }
        .controls {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }
        .btn {
            padding: 12px 20px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
            color: white;
            font-weight: bold;
        }
        .show-answer-btn{background-color: #2ecc71;}, .modal-confirm-btn { background-color: #3498db; }
         .modal-confirm-btn:hover { background-color: #2980b9; }
        .correct-btn { background-color: #2ecc71; }
        .correct-btn:hover { background-color: #27ae60; }
        .incorrect-btn, .modal-cancel-btn { color: #e74c3c; }
        .incorrect-btn:hover, .modal-cancel-btn:hover { color: #c0392b; }
        .feedback {
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
        }
        .flashcard-form {
            text-align: left;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #bdc3c7;
            border-radius: 8px;
            background-color: #f9fbfd;
        }
        .flashcard-form input, .flashcard-form textarea {
            width: 95%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .dashboard-link-container {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
        }
        .logout-btn-small {
            padding: 8px 16px;
            font-size: 20px;
        }
        /* Modal Styles */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }
        .modal-content {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            text-align: center;
            max-width: 400px;
            width: 90%;
        }
        .modal-buttons {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            gap: 10px;
        }
    </style>
</head>
<body>

<!-- Logout button in a new container at the top right -->
<div class="logout-container">
    <form id="logout-form" action="LogoutServlet" method="post">
        <button type="submit" class="btn incorrect-btn logout-btn-small">Logout</button>
    </form>
</div>

<div class="container">
    <h1>🧠 Memory Booster</h1>
    <p>Test your knowledge with these flashcards! Try to recall the definition before revealing the answer.</p>

    <div class="flashcard-container">
        <div id="term-display"></div>
        <div id="definition-display"></div>
    </div>

    <div class="controls" id="initial-controls">
        <button id="show-answer-btn" class="btn show-answer-btn">Show Answer</button>
    </div>

    <div class="controls" id="feedback-controls" style="display: none;">
        <button id="correct-btn" class="btn correct-btn">I remembered! 🎉</button>
        <button id="incorrect-btn" class="btn incorrect-btn">I didn't remember. 😔</button>
    </div>
    
    <div id="status-message" class="feedback"></div>

    
</div>

<div class="container">
    <h2>Manage Your Flashcards</h2>
    <!-- Create Flashcard Form -->
    <div class="flashcard-form">
        <h3>Create New Flashcard</h3>
        <input type="text" id="term-input" placeholder="Enter term" required>
        <textarea id="definition-input" placeholder="Enter definition" required></textarea>
        <button id="save-card-btn" class="btn show-answer-btn">Save Flashcard</button>
    </div>
    <!-- Back to Dashboard button at the bottom center of this box -->
    <div class="dashboard-link-container">
        <button id="back-to-dashboard-btn" class="btn show-answer-btn">Back to Dashboard</button>
    </div>
</div>

<!-- Custom Modal for Alerts and Confirmations -->
<div id="custom-modal" class="modal-overlay">
    <div class="modal-content">
        <p id="modal-message"></p>
        <div id="modal-buttons" class="modal-buttons">
            <button id="modal-confirm-btn" class="btn modal-confirm-btn" style="display: none;">Confirm</button>
            <button id="modal-cancel-btn" class="btn modal-cancel-btn">OK</button>
        </div>
    </div>
</div>

<script>
    // ====================================================================
    // ======================= Memory Booster Logic =======================
    // ====================================================================

    let flashcards = [];
    let currentCardIndex = 0;
    let score = 0;

    const termDisplay = document.getElementById("term-display");
    const definitionDisplay = document.getElementById("definition-display");
    const showAnswerBtn = document.getElementById("show-answer-btn");
    const correctBtn = document.getElementById("correct-btn");
    const incorrectBtn = document.getElementById("incorrect-btn");
    const initialControls = document.getElementById("initial-controls");
    const feedbackControls = document.getElementById("feedback-controls");
    const statusMessage = document.getElementById("status-message");

    const termInput = document.getElementById("term-input");
    const definitionInput = document.getElementById("definition-input");
    const saveCardBtn = document.getElementById("save-card-btn");
    const backToDashboardBtn = document.getElementById("back-to-dashboard-btn");

    // Modal elements
    const modalOverlay = document.getElementById("custom-modal");
    const modalMessage = document.getElementById("modal-message");
    const modalConfirmBtn = document.getElementById("modal-confirm-btn");
    const modalCancelBtn = document.getElementById("modal-cancel-btn");

    // Event listeners
    document.addEventListener("DOMContentLoaded", () => {
        fetchFlashcards();
    });

    showAnswerBtn.addEventListener("click", showAnswer);
    correctBtn.addEventListener("click", () => handleAnswer(true));
    incorrectBtn.addEventListener("click", () => handleAnswer(false));
    saveCardBtn.addEventListener("click", saveFlashcard);
    backToDashboardBtn.addEventListener("click", () => {
        window.location.href = 'userdashboard.jsp';
    });

    /**
     * Helper function to show a custom modal message.
     * @param {string} message - The message to display.
     * @param {function} onConfirm - The function to call on confirmation (optional).
     * @param {string} confirmText - Text for the confirm button (optional).
     */
    function showModal(message, onConfirm = null, confirmText = 'Confirm') {
        modalMessage.innerText = message;
        if (onConfirm) {
            modalConfirmBtn.style.display = 'inline-block';
            modalConfirmBtn.innerText = confirmText;
            modalConfirmBtn.onclick = () => {
                onConfirm();
                modalOverlay.style.display = 'none';
            };
            modalCancelBtn.innerText = 'Cancel';
            modalCancelBtn.onclick = () => {
                modalOverlay.style.display = 'none';
            };
        } else {
            modalConfirmBtn.style.display = 'none';
            modalCancelBtn.innerText = 'OK';
            modalCancelBtn.onclick = () => {
                modalOverlay.style.display = 'none';
            };
        }
        modalOverlay.style.display = 'flex';
    }

    /**
     * Fetches flashcards from the server and populates the study tool.
     */
    function fetchFlashcards() {
        fetch('FlashcardServlet')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                if (Array.isArray(data)) {
                    flashcards = data;
                    
                    if (flashcards.length > 0) {
                        loadCard();
                    } else {
                        termDisplay.innerText = "No flashcards found.";
                    }
                } else {
                    console.error("Fetched data is not an array:", data);
                    termDisplay.innerText = "Error: Invalid data format from server.";
                }
            })
            .catch(error => {
                console.error("Error fetching flashcards:", error);
                termDisplay.innerText = "Error loading flashcards.";
            });
    }

    /**
     * Loads the current flashcard's term onto the screen.
     */
    function loadCard() {
        if (flashcards.length > 0 && currentCardIndex < flashcards.length) {
            const card = flashcards[currentCardIndex];
            termDisplay.innerText = card.term;
            definitionDisplay.innerText = card.definition;
            definitionDisplay.style.display = 'none';
            
            initialControls.style.display = 'flex';
            feedbackControls.style.display = 'none';
            statusMessage.innerText = "";
        } else {
            endSession();
        }
    }

    /**
     * Displays the definition of the current flashcard.
     */
    function showAnswer() {
        definitionDisplay.style.display = 'block';
        initialControls.style.display = 'none';
        feedbackControls.style.display = 'flex';
    }

    /**
     * Handles the user's response to the flashcard.
     * @param {boolean} isCorrect - true if the user remembered, false otherwise.
     */
    function handleAnswer(isCorrect) {
        if (isCorrect) {
            score++;
            statusMessage.innerText = `Correct! Your score: ${score}/${flashcards.length}`;
        } else {
            statusMessage.innerText = `Incorrect. Your score: ${score}/${flashcards.length}`;
        }
        currentCardIndex++;
        
        setTimeout(() => {
            loadCard();
        }, 1000);
    }

    /**
     * Handles creating a new flashcard.
     */
    function saveFlashcard() {
        const term = termInput.value;
        const definition = definitionInput.value;
        
        if (!term || !definition) {
            showModal("Both term and definition are required.");
            return;
        }

        const body = {
            action: 'create',
            term: term,
            definition: definition,
        };

        fetch('FlashcardServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(body)
        })
        .then(response => response.json())
        .then(result => {
            if (result.success) {
                showModal("Flashcard saved successfully!");
                clearForm();
                fetchFlashcards(); // Refresh the deck with the new card
            } else {
                showModal("Failed to save flashcard: " + result.message);
            }
        })
        .catch(error => {
            console.error("Error saving flashcard:", error);
            showModal("An error occurred while saving the flashcard.");
        });
    }
    
    /**
     * Resets the form.
     */
    function clearForm() {
        termInput.value = '';
        definitionInput.value = '';
    }

    /**
     * Displays the final score and ends the session.
     */
    function endSession() {
        termDisplay.innerText = "Session Complete!";
        definitionDisplay.innerText = `You finished the deck! Your final score is: ${score} out of ${flashcards.length}.`;
        definitionDisplay.style.display = 'block';
        initialControls.style.display = 'none';
        feedbackControls.style.display = 'none';
        statusMessage.innerText = "Great job!";
    }
</script>

</body>
</html>
