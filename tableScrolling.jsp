<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .scrollable-table {
            height: 500px;
            overflow-y: auto;
            width: 400px;
            scroll-snap-type: y mandatory;
        }

        .scrollable-table>.table {
            width: 100%;
        }

        .table {
            border-collapse: collapse;
            font-size: 14px;
            width: 400px;
        }

        .table th {
            background-color: aqua;
            color: #ffffff;
            text-align: left;

            /*floating*/
            position: sticky;
            top: 0px;
        }

        .table th,
        .table td {
            padding: 6px 8px;
            font-weight: normal;
        }

        .table tr {
            scroll-snap-align: start;
        }

        .table tbody tr:nth-of-type(even) {
            background-color: antiquewhite;
        }
    </style>
</head>

<body>
    <div class="scrollable-table">
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Point</th>
                    <th>Color</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>John</td>
                    <td>6510</td>
                    <td>Fuscia</td>
                </tr>
            </tbody>
        </table>
    </div>

</body>

</html>