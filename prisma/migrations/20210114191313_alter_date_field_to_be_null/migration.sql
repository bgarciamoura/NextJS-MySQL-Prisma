/*
  Warnings:

  - Made the column `data` on table `post` required. The migration will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `post` MODIFY `data` DATETIME(3) NOT NULL;
