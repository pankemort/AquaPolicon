import express  from "express";

import router from "./routes/user.js";
import { config } from "dotenv";


export const app = express()  ;

config({
    path:"./data/config.env",
});
//middleware 
app.use(express.json())
app.use("/users",router)


app.get('/' , (req,res) =>{
    res.send("nice wokring")
})