// Подключаем библиотеку для работы с WebSocket
const WebSocket = require('ws');
// Создаём подключение к WS
let wsServer = new WebSocket.Server({
    port: 8092
});
// Создаём массив для хранения всех подключенных пользователей
let users = []

// Проверяем подключение
wsServer.on('connection', function (ws) {
    Делаем подключение пользователя
    let user = {
        connection: ws
    }
    // Добавляем нового пользователя ко всем остальным
    users.push(user)
    // Получаем сообщение от клиента
    ws.on('message', function (message) {
        // Перебираем всех подключенных клиентов
        for (let u of users) {
            // Отправляем им полученное сообщения
            u.connection.send(message)
        }
    })
    // Делаем действие при выходе пользователя из чата
    ws.on('close', function () {
        // Получаем ID этого пользователя
        let id = users.indexOf(user)
        // Убираем этого пользователя
        users.splice(id, 1)
    })
})