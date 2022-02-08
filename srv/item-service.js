const cds = require("@sap/cds");
const crypto = require("crypto");

module.exports = (srv) => {
    const { PassItems } = srv.entities;


    srv.on("CREATE", "passItems", async (req, next) => {
        req.data.password = encryptPassword(req.data.password);
        return next();
    });


    srv.before("READ", "passItems", async (req, next) => {
        req.data.password = decryptPassword(req.data.password);
        return next();
    });
    
}

const encryptPassword = (passwordToEncrypt) => {
    const iv = crypto.randomBytes(16).toString("hex").slice(0, 16);
    const password = "12wqkdoaldhnmdf938376529309128934";
    const key = crypto.scryptSync(password, 'salt', 32);
    const encrypter = crypto.createCipheriv("aes-256-cbc", key, iv);
    let encrypted = encrypter.update(passwordToEncrypt, "utf8", "hex");
    encrypted += encrypter.final("hex");

    return encrypted;
}

const decryptPassword = (passwordToDecrypt) => {
    const iv = crypto.randomBytes(16).toString("hex").slice(0, 16);
    const password = "12wqkdoaldhnmdf938376529309128934";
    const key = crypto.scryptSync(password, 'salt', 32);

    var decrypter = crypto.createDecipheriv("aes-256-cbc", key, iv);
    let decrypted = decrypter.update(passwordToDecrypt, "utf8", "hex");
    decrypted += decrypter.final("hex");
    
    return decrypted;
}