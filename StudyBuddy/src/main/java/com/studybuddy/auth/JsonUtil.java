package com.studybuddy.auth;


import com.studybuddy.model.Goal;
import org.json.JSONArray;
import org.json.JSONObject;
import java.util.List;

public class JsonUtil {

    public static JSONArray convertGoalsToJson(List<Goal> goals) {
        JSONArray jsonArray = new JSONArray();
        for (Goal goal : goals) {
            JSONObject jsonObject = new JSONObject();
            try {
                jsonObject.put("id", goal.getId());
                jsonObject.put("text", goal.getText());
                jsonObject.put("completed", goal.isCompleted());
            } catch (Exception e) {
                System.err.println("Error converting Goal object to JSON: " + e.getMessage());
                e.printStackTrace();
            }
            jsonArray.put(jsonObject);
        }
        return jsonArray;
    }
}