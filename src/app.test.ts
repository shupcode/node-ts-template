import { helloWorld } from "./app";

test("print hello world", async () => {
  await helloWorld();
});
