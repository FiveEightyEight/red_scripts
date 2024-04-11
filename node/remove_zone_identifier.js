const fs = require('fs');
const path = require('path');

function deleteZoneIdentifierFiles(startPath) {
  if (!fs.existsSync(startPath)) {
    console.log("Directory does not exist: ", startPath);
    return;
  }

  const filesAndDirectories = fs.readdirSync(startPath);

  filesAndDirectories.forEach((name) => {
    const currentPath = path.join(startPath, name);
    const stat = fs.lstatSync(currentPath);

    if (stat.isDirectory()) {
      deleteZoneIdentifierFiles(currentPath); // Recurse into subdirectories
    } else if (stat.isFile() && currentPath.endsWith("Zone.Identifier")) {
      fs.unlinkSync(currentPath); // Delete the file
      console.log("Deleted: ", currentPath);
    }
  });
}

// Replace '.' with your desired directory to start from, '.' means the current directory.
deleteZoneIdentifierFiles('.');
