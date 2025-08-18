package com.studybuddy.auth;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.studybuddy.dao.FlashcardDAO;
import com.studybuddy.model.Flashcard;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FlashcardServlet extends HttpServlet {

    private FlashcardDAO flashcardDAO;

    public FlashcardServlet() {
        this.flashcardDAO = new FlashcardDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        try {
            List<Flashcard> flashcards = flashcardDAO.getAllFlashcards();
            Gson gson = new Gson();
            String json = gson.toJson(flashcards);
            out.print(json);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            JsonObject errorObject = new JsonObject();
            errorObject.addProperty("error", "Error fetching flashcards: " + e.getMessage());
            out.print(errorObject.toString());
        } finally {
            out.flush();
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        JsonObject responseObject = new JsonObject();

        try (BufferedReader reader = request.getReader()) {
            JsonObject jsonRequest = gson.fromJson(reader, JsonObject.class);
            String action = jsonRequest.get("action").getAsString();
            
            if ("create".equals(action)) {
                String term = jsonRequest.get("term").getAsString();
                String definition = jsonRequest.get("definition").getAsString();
                Flashcard newCard = new Flashcard(term, definition);
                flashcardDAO.addFlashcard(newCard);
                responseObject.addProperty("success", true);
                responseObject.addProperty("message", "Flashcard created successfully.");

            } else if ("update".equals(action)) {
                int id = jsonRequest.get("id").getAsInt();
                String term = jsonRequest.get("term").getAsString();
                String definition = jsonRequest.get("definition").getAsString();
                Flashcard updatedCard = new Flashcard(id, term, definition);
                flashcardDAO.updateFlashcard(updatedCard);
                responseObject.addProperty("success", true);
                responseObject.addProperty("message", "Flashcard updated successfully.");

            } else if ("delete".equals(action)) {
                int id = jsonRequest.get("id").getAsInt();
                flashcardDAO.deleteFlashcard(id);
                responseObject.addProperty("success", true);
                responseObject.addProperty("message", "Flashcard deleted successfully.");

            } else {
                responseObject.addProperty("success", false);
                responseObject.addProperty("message", "Invalid action specified.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            responseObject.addProperty("success", false);
            responseObject.addProperty("message", "An error occurred: " + e.getMessage());
        } finally {
            out.print(responseObject.toString());
            out.flush();
        }
    }
}
