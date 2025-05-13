# Terraform

## Folder Structure

**Folder Contents**

| Folder                   | Description                                                        |
|--------------------------|--------------------------------------------------------------------|
| `for_Locals`             | Use For Loops in Locals. Try with Terraform Console.               |
| `forWithLocals(IAM)`     | IAM identities created using For with info from locals.            |
| `count_foreach_for`      | Explain the differences for using count, foreach and for meta arguments. |
| `DynamicBlocks_ForSGRules` | Use Dynamic Blocks for creating Security Group rules.             |

---

## Git Workflow: Check-in, Commit, Branch, and Merge

Follow these steps to check in code, commit, create a branch, and merge code into the repository:

1. **Clone the repository (if not already done):**
   ```sh
   git clone <repository-url>
   ```

2. **Navigate to the repository folder:**
   ```sh
   cd <repository-folder>
   ```

3. **Check the current status:**
   ```sh
   git status
   ```

4. **Create a new branch:**
   ```sh
   git checkout -b <new-branch-name>
   ```

5. **Add changes to the staging area:**
   ```sh
   git add .
   ```
   Or add specific files:
   ```sh
   git add <file1> <file2>
   ```

6. **Commit your changes:**
   ```sh
   git commit -m "Your commit message"
   ```

7. **Push your branch to the remote repository:**
   ```sh
   git push origin <new-branch-name>
   ```

8. **Switch to the main branch:**
   ```sh
   git checkout main
   ```
   Or:
   ```sh
   git checkout master
   ```

9. **Pull the latest changes from the remote main branch:**
   ```sh
   git pull origin main
   ```
   Or:
   ```sh
   git pull origin master
   ```

10. **Merge your feature branch into the main branch:**
    ```sh
    git merge <new-branch-name>
    ```

11. **Push the merged changes to the remote repository:**
    ```sh
    git push origin main
    ```
    Or:
    ```sh
    git push origin master
    ```

> **Note:**  
> Replace `<repository-url>`, `<repository-folder>`, and `<new-branch-name>` with your actual values.  
> For collaborative projects, consider creating a Pull Request (PR) on your Git hosting platform instead of merging locally.