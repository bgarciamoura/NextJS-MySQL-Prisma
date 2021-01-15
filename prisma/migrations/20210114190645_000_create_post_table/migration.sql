-- CreateTable
CREATE TABLE `customer` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `cia` INT NOT NULL DEFAULT 1,
    `equipe` INT,
    `setor` INT,
    `letra` VARCHAR(191),
    `crm` INT,
    `uf_crm` VARCHAR(191),
    `nome` VARCHAR(191),
    `sexo` VARCHAR(191),
    `esp1` VARCHAR(191),
    `esp2` VARCHAR(191),
    `classificacao` VARCHAR(191),
    `potencial` VARCHAR(191),
    `dtnasc` DATETIME(3),
    `nomesecre` VARCHAR(191),
    `dtnascsec` DATETIME(3),
    `email` VARCHAR(191),
    `obsrep` VARCHAR(191),
    `frequencia` VARCHAR(191),
    `cpf` VARCHAR(191),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customer_address` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `tp_lograd` VARCHAR(191),
    `lograd` VARCHAR(191),
    `numero` VARCHAR(191),
    `compl` VARCHAR(191),
    `cep` INT,
    `bairro` VARCHAR(191),
    `uf` VARCHAR(191),
    `ddd` INT,
    `telef1` INT,
    `ramal1` INT,
    `telef2` INT,
    `ramal2` INT,
    `telef3` INT,
    `ramal3` INT,
    `fax` INT,
    `ramal_fax` INT,
    `celular` INT,
    `customer_id` INT,
INDEX `customer_address_FK`(`customer_id`),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `post` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `post` VARCHAR(191),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `customer_address` ADD FOREIGN KEY (`customer_id`) REFERENCES `customer`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
