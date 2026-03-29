import express, { Request, Response } from 'express';
import authRoutes from "./routes/authRoutes";

const app = express();

app.use(express.json());

app.use("/auth", authRoutes);

// app.get('/', (req: Request, res: Response) => {
//   console.log("test");
//   res.send("yes it works");
// });

const PORT = process.env.PORT || 5000;

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server is running on port ${PORT}`);
});