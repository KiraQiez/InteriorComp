<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GPA Calculator</title>
    <style>
        table,
        th,
        td {
            border: 1px solid black;
            border-collapse: collapse;
        }

        th,
        td {
            padding: 5px;
            text-align: left;
        }

        .point-value {
            width: 50px;
        }
    </style>
    <script>
        function updatePoint(subject, value) {
            let points = {
                'A': 4,
                'B': 3,
                'C': 2,
                'D': 1,
                'F': 0
            };
            document.getElementById(subject + '-points').innerText = points[value];
            calculateGPA();
        }

        function calculateGPA() {
            let totalPoints = 0;
            let subjects = ['calculus', 'statistics', 'algebra'];
            let creditHours = 3;
            subjects.forEach(subject => {
                let grade = document.getElementById(subject + '-grade').value;
                let points = {
                    'A': 4,
                    'B': 3,
                    'C': 2,
                    'D': 1,
                    'F': 0
                };
                totalPoints += points[grade] * creditHours;
            });
            let gpa = totalPoints / (subjects.length * creditHours);
            document.getElementById('gpa').innerText = gpa.toFixed(2);
        }
    </script>
</head>

<body>
    <h2>GPA Calculator</h2>
    <form action="#">
        <table style="width:100%">
            <tr>
                <th>Subject</th>
                <th>Grade</th>
                <th>Points</th>
            </tr>
            <tr>
                <td>Calculus</td>
                <td>
                    <select id="calculus-grade" name="calculus-grade" onchange="updatePoint('calculus', this.value)">
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                        <option value="F">F</option>
                    </select>
                </td>
                <td class="point-value" id="calculus-points">4</td>
            </tr>
            <tr>
                <td>Statistics</td>
                <td>
                    <select id="statistics-grade" name="statistics-grade"
                        onchange="updatePoint('statistics', this.value)">
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                        <option value="F">F</option>
                    </select>
                </td>
                <td class="point-value" id="statistics-points">4</td>
            </tr>
            <tr>
                <td>Algebra</td>
                <td>
                    <select id="algebra-grade" name="algebra-grade" onchange="updatePoint('algebra', this.value)">
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                        <option value="F">F</option>
                    </select>
                </td>
                <td class="point-value" id="algebra-points">4</td>
            </tr>
        </table>
        <br>
        <strong>GPA: </strong><span id="gpa">4.00</span>
    </form>
</body>

</html>