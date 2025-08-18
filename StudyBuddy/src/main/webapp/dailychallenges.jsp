<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.tailwindcss.com"></script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daily Challenges</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-image: linear-gradient(to right, #4b6cb7, #182848);
        }
        .table-responsive {
            display: block;
            width: 100%;
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }
        .scrollable-table {
            min-width: 600px;
        }
    </style>
</head>
<body class="flex flex-col items-center min-h-screen p-4 text-gray-800">
    <!-- Header with navigation buttons -->
    <div class="fixed top-0 left-0 right-0 p-4 flex justify-between items-center z-10">
        <a href="userdashboard.jsp" class="px-4 py-2 bg-green-500 text-white rounded-lg shadow-md hover:bg-green-600 transition-colors">
            Back to Dashboard
        </a>
        <a href="LogoutServlet" class="px-4 py-2 bg-red-600 text-white rounded-lg shadow-md hover:bg-red-700 transition-colors">
            Logout
        </a>
    </div>

    <!-- Main content container -->
    <div class="w-full max-w-4xl mx-auto mt-24 space-y-8">
        <h1 class="text-4xl font-bold text-white text-center">Your Daily Challenges</h1>

        <!-- Streak Card -->
        <div class="p-8 rounded-2xl shadow-2xl text-white bg-gradient-to-r from-purple-600 to-indigo-600 flex items-center justify-between transition-transform transform hover:scale-105">
            <div>
                <h2 class="text-2xl font-semibold">Current Streak</h2>
                <p class="text-lg font-light opacity-80">Keep up the great work!</p>
            </div>
            <div class="flex items-center space-x-4">
                <span class="text-7xl">🔥</span>
                <p class="text-7xl font-bold">
                    <c:out value="${currentStreak}" default="0"/>
                </p>
            </div>
        </div>

        <!-- Daily Challenge Card -->
        <div class="bg-white p-8 rounded-2xl shadow-xl border-t-4 border-blue-500">
            <h2 class="text-2xl font-bold text-gray-800 mb-4">Today's Challenge</h2>
            
            <c:if test="${dailyChallenge != null}">
                <div class="flex items-start">
                    <!-- Icon placeholder -->
                    <div class="flex-shrink-0 mr-4 text-blue-500">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-10 w-10" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M13 10V3L4 14h7v7l9-11h-7z" />
                        </svg>
                    </div>
                    <div>
                        <h3 class="text-2xl font-bold">
                            <c:out value="${dailyChallenge.title}"/>
                        </h3>
                        <p class="text-gray-600 mt-2 leading-relaxed">
                            <c:out value="${dailyChallenge.description}"/>
                        </p>
                    </div>
                </div>

                <!-- Check if the challenge is already completed -->
                <c:choose>
                    <c:when test="${challengeCompleted}">
                        <div class="mt-6 flex items-center justify-center py-3 px-6 rounded-lg text-green-700 bg-green-100 font-semibold border border-green-200">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                            <span>Challenge Completed Today!</span>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- Form to complete the challenge -->
                        <form action="/completeChallenge" method="post" class="mt-6">
                            <input type="hidden" name="challengeId" value="<c:out value="${dailyChallenge.id}"/>">
                            <button type="submit" class="w-full py-3 px-4 rounded-lg shadow-md text-white font-semibold bg-blue-600 hover:bg-blue-700 transition-colors focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                                I Completed This Challenge
                            </button>
                        </form>
                    </c:otherwise>
                </c:choose>
            </c:if>
            <c:if test="${dailyChallenge == null}">
                <p class="text-gray-500 text-center italic py-4">No challenge available for today. Check back tomorrow!</p>
            </c:if>
        </div>

        <!-- Challenge History Section -->
        <div>
            <h2 class="text-2xl font-bold text-white mb-4">Challenge History</h2>
            <div class="bg-white p-6 rounded-2xl shadow-xl overflow-x-auto">
                <c:if test="${not empty challengeHistory}">
                    <table class="min-w-full table-auto">
                        <thead>
                            <tr class="bg-gray-200 text-gray-700 uppercase text-sm leading-normal">
                                <th class="py-3 px-6 text-left">Challenge</th>
                                <th class="py-3 px-6 text-left">Date</th>
                                <th class="py-3 px-6 text-center">Status</th>
                            </tr>
                        </thead>
                        <tbody class="text-gray-600 text-sm font-light">
                            <c:forEach var="entry" items="${challengeHistory}">
                                <tr class="border-b border-gray-200 hover:bg-gray-100">
                                    <td class="py-3 px-6 text-left whitespace-nowrap">
                                        <div class="flex items-center">
                                            <span class="font-medium">
                                                <c:out value="${entry.challengeTitle}"/>
                                            </span>
                                        </div>
                                    </td>
                                    <td class="py-3 px-6 text-left">
                                        <c:out value="${entry.date}"/>
                                    </td>
                                    <td class="py-3 px-6 text-center">
                                        <c:choose>
                                            <c:when test="${entry.isCompleted}">
                                                <span class="bg-green-200 text-green-600 py-1 px-3 rounded-full text-xs">Completed</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="bg-red-200 text-red-600 py-1 px-3 rounded-full text-xs">Missed</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty challengeHistory}">
                    <p class="text-center italic text-gray-500 py-4">Your challenge history will appear here.</p>
                </c:if>
            </div>
        </div>
    </div>
</body>
</html>

