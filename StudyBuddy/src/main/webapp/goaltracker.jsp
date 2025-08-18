<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Study Buddy Goals</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif;
            background: url('images/studygoals.jpg') no-repeat center center/cover;
            color: #333;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 600px;
            margin-top: 20px;
            display: flex;
            flex-direction: column;
        }
        h1, h2 {
            text-align: center;
            color: #2c3e50;
        }
        .logout {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 0.9rem;
        }
        .logout a {
            text-decoration: none;
            color: #e74c3c;
            font-weight: bold;
        }
        .logout a:hover {
            text-decoration: underline;
        }
        #goalForm {
            display: flex;
            margin-bottom: 20px;
        }
        #newGoalText {
            flex-grow: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            outline: none;
        }
        #newGoalText:focus {
            border-color: #3498db;
        }
        #goalForm button {
            padding: 10px 15px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
            margin-left: 10px;
            transition: background-color 0.2s;
        }
        #goalForm button:hover {
            background-color: #2980b9;
        }
        #goalsList {
            list-style: none;
            padding: 0;
            flex-grow: 1;
        }
        .goal-item {
            display: flex;
            align-items: center;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 8px;
            margin-bottom: 10px;
            transition: background-color 0.2s;
            word-break: break-word;
        }
        .goal-item:hover {
            background-color: #f1f1f1;
        }
        .goal-item input[type="checkbox"] {
            margin-right: 15px;
            min-width: 20px;
            min-height: 20px;
            cursor: pointer;
        }
        .goal-item span {
            flex-grow: 1;
        }
        .goal-buttons {
            margin-left: auto;
            display: flex;
            gap: 10px;
        }
        .goal-buttons button {
            padding: 5px 10px;
            font-size: 0.8rem;
            border-radius: 6px;
            cursor: pointer;
            border: 1px solid #ddd;
        }
        .edit-button {
            background-color: #f1c40f;
            color: white;
        }
        .delete-button {
            background-color: #e74c3c;
            color: white;
        }
        .dashboard-link {
            text-align: center;
            margin-top: 20px;
        }
        .dashboard-link a {
            padding: 12px 24px;
            background-color: #2ecc71;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.2s;
        }
        .dashboard-link a:hover {
            background-color: #27ae60;
        }
        /* Custom modal for confirmation */
        .modal {
            display: none;
            position: fixed;
            z-index: 1001;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 400px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }
    </style>
</head>
<body>
    <%
        // Check if the user is logged in
	String fullName = (String) session.getAttribute("fullName");
        if (fullName == null) {
            response.sendRedirect("home.jsp");
            return;
        }
    %>
    <div class="logout">
        <a href="LogoutServlet">Logout</a>
    </div>
    <div class="container">
        <h2>Your Study Goals</h2>
        
        <form id="goalForm">
            <input type="text" id="newGoalText" placeholder="Add a new goal..." required>
            <button type="submit">Add</button>
        </form>
        
        <ul id="goalsList">
            <!-- Goals will be dynamically loaded here by JavaScript -->
        </ul>
        
        <div class="dashboard-link">
            <a href="userdashboard.jsp">Back to Dashboard</a>
        </div>
    </div>

    <!-- Custom confirmation modal for deletion -->
    <div id="deleteModal" class="modal">
        <div class="modal-content">
            <p>Are you sure you want to delete this goal?</p>
            <button id="confirmDelete" class="delete-button">Yes</button>
            <button id="cancelDelete">No</button>
        </div>
    </div>

    <script>
        // This script handles all front-end interactions for the goals page.

        document.addEventListener('DOMContentLoaded', () => {
            // --- Asynchronous function to fetch and display goals ---
            const loadGoals = async () => {
                try {
                    const response = await fetch('GoalServlet?action=list');
                    if (!response.ok) {
                        throw new Error('Failed to fetch goals: ' + response.statusText);
                    }
                    const goals = await response.json();
                    const goalsList = document.getElementById('goalsList');
                    goalsList.innerHTML = ''; // Clear existing goals
                    goals.forEach(goal => {
                        const goalElement = document.createElement('li');
                        goalElement.className = 'goal-item';
                        // Use a dataset to store the goal ID for easy access
                        goalElement.dataset.id = goal.id;
                        
                        const checkbox = document.createElement('input');
                        checkbox.type = 'checkbox';
                        checkbox.checked = goal.completed;
                        // Add an event listener to handle the toggle action
                        checkbox.addEventListener('change', () => toggleGoal(goal.id, checkbox.checked));

                        const goalText = document.createElement('span');
                        goalText.textContent = goal.text;
                        
                        // Buttons container
                        const buttonsContainer = document.createElement('div');
                        buttonsContainer.className = 'goal-buttons';

                        const editButton = document.createElement('button');
                        editButton.className = 'edit-button';
                        editButton.textContent = 'Edit';
                        editButton.addEventListener('click', () => startEditGoal(goal.id, goalText));

                        const deleteButton = document.createElement('button');
                        deleteButton.className = 'delete-button';
                        deleteButton.textContent = 'Delete';
                        deleteButton.addEventListener('click', () => showDeleteConfirmation(goal.id));

                        buttonsContainer.appendChild(editButton);
                        buttonsContainer.appendChild(deleteButton);
                        
                        goalElement.appendChild(checkbox);
                        goalElement.appendChild(goalText);
                        goalElement.appendChild(buttonsContainer);
                        goalsList.appendChild(goalElement);
                    });
                } catch (error) {
                    console.error(error);
                    showCustomAlert('Error loading goals: ' + error.message, 'error');
                }
            };

            // --- Function to toggle goal completion status ---
            const toggleGoal = async (goalId, isCompleted) => {
                console.log(`Toggling goal ${goalId} to completed: ${isCompleted}`);
                const formData = new URLSearchParams();
                formData.append('action', 'toggle');
                formData.append('id', goalId);
                formData.append('completed', isCompleted);

                try {
                    const response = await fetch('GoalServlet', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: "action=toggle&id=" + goalId + "&completed=true"

                    });

                    if (!response.ok) {
                        throw new Error('Failed to update goal: ' + response.statusText);
                    }
                    
                    loadGoals();

                } catch (error) {
                    console.error(error);
                    showCustomAlert('Failed to update goal.', 'error');
                    const checkbox = document.querySelector(`li[data-id="${goalId}"] input[type="checkbox"]`);
                    if (checkbox) {
                        checkbox.checked = !isCompleted;
                    }
                }
            };
            
            // --- Function to add a new goal ---
            const addGoal = async (event) => {
                event.preventDefault();
                const goalInput = document.getElementById('newGoalText');
                const goalText = goalInput.value.trim();

                if (goalText === '') {
                    showCustomAlert('Please enter a goal.', 'warning');
                    return;
                }

                const formData = new URLSearchParams();
                formData.append('action', 'add');
                formData.append('goal', goalText);

                try {
                    const response = await fetch('GoalServlet', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: formData
                    });

                    if (!response.ok) {
                        throw new Error('Failed to add goal.');
                    }

                    goalInput.value = '';
                    loadGoals();

                } catch (error) {
                    console.error(error);
                    showCustomAlert('Failed to add goal.', 'error');
                }
            };

            // --- Function to edit a goal inline ---
            const startEditGoal = (goalId, goalTextSpan) => {
                const currentText = goalTextSpan.textContent;
                const input = document.createElement('input');
                input.type = 'text';
                input.value = currentText;
                input.style.flexGrow = '1';
                input.style.border = '1px solid #3498db';
                input.style.borderRadius = '4px';
                input.style.padding = '5px';
                input.style.marginRight = '10px';

                goalTextSpan.replaceWith(input);
                input.focus();

                const goalItem = input.closest('.goal-item');
                const buttons = goalItem.querySelector('.goal-buttons');
                buttons.style.display = 'none';

                const saveButton = document.createElement('button');
                saveButton.textContent = 'Save';
                saveButton.style.backgroundColor = '#2ecc71';
                saveButton.style.color = 'white';
                saveButton.style.border = 'none';
                saveButton.style.padding = '5px 10px';
                saveButton.style.borderRadius = '6px';
                
                const cancelButton = document.createElement('button');
                cancelButton.textContent = 'Cancel';
                cancelButton.style.backgroundColor = '#95a5a6';
                cancelButton.style.color = 'white';
                cancelButton.style.border = 'none';
                cancelButton.style.padding = '5px 10px';
                cancelButton.style.borderRadius = '6px';
                
                const editControls = document.createElement('div');
                editControls.style.display = 'flex';
                editControls.style.gap = '10px';
                editControls.style.marginLeft = 'auto';
                editControls.appendChild(saveButton);
                editControls.appendChild(cancelButton);
                
                goalItem.appendChild(editControls);

                saveButton.addEventListener('click', () => editGoal(goalId, input.value));
                cancelButton.addEventListener('click', () => loadGoals());
            };
            
            const editGoal = async (goalId, newText) => {
                const formData = new URLSearchParams();
                formData.append('action', 'edit');
                formData.append('id', goalId);
                formData.append('text', newText);

                try {
                    const response = await fetch('GoalServlet', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: formData
                    });

                    if (!response.ok) {
                        throw new Error('Failed to edit goal.');
                    }
                    loadGoals();
                } catch (error) {
                    console.error(error);
                    showCustomAlert('Failed to edit goal.', 'error');
                }
            };
            
            // --- Function to delete a goal ---
            const deleteGoal = async (goalId) => {
                const formData = new URLSearchParams();
                formData.append('action', 'delete');
                formData.append('id', goalId);

                try {
                    const response = await fetch('GoalServlet', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded',
                        },
                        body: formData
                    });
                    
                    if (!response.ok) {
                        throw new Error('Failed to delete goal: ' + response.statusText);
                    }
                    
                    loadGoals();
                } catch (error) {
                    console.error(error);
                    showCustomAlert('Failed to delete goal.', 'error');
                }
            };
            
            // --- Custom alert and confirmation functions ---
            const showCustomAlert = (message, type) => {
                const alertBox = document.createElement('div');
                alertBox.textContent = message;
                let bgColor = '#3498db';
                if (type === 'error') bgColor = '#f44336';
                if (type === 'warning') bgColor = '#ff9800';
                
                alertBox.style.cssText = `
                    position: fixed; top: 20px; left: 50%; transform: translateX(-50%);
                    background-color: ${bgColor}; color: white; padding: 15px;
                    border-radius: 5px; z-index: 1000;
                    transition: all 0.3s ease-in-out;
                    opacity: 0;
                `;
                document.body.appendChild(alertBox);

                setTimeout(() => {
                    alertBox.style.opacity = '1';
                }, 10);

                setTimeout(() => {
                    alertBox.style.opacity = '0';
                    setTimeout(() => alertBox.remove(), 300);
                }, 3000);
            };

            const showDeleteConfirmation = (goalId) => {
                const modal = document.getElementById('deleteModal');
                modal.style.display = 'block';

                const confirmBtn = document.getElementById('confirmDelete');
                const cancelBtn = document.getElementById('cancelDelete');

                const handleConfirm = () => {
                    deleteGoal(goalId);
                    modal.style.display = 'none';
                    confirmBtn.removeEventListener('click', handleConfirm);
                    cancelBtn.removeEventListener('click', handleCancel);
                };

                const handleCancel = () => {
                    modal.style.display = 'none';
                    confirmBtn.removeEventListener('click', handleConfirm);
                    cancelBtn.removeEventListener('click', handleCancel);
                };

                confirmBtn.addEventListener('click', handleConfirm);
                cancelBtn.addEventListener('click', handleCancel);

                window.onclick = (event) => {
                    if (event.target == modal) {
                        handleCancel();
                    }
                };
            };
            
            // --- Set up event listeners ---
            const goalForm = document.getElementById('goalForm');
            if (goalForm) {
                goalForm.addEventListener('submit', addGoal);
            }
            
            loadGoals();
        });
    </script>
</body>
</html>
