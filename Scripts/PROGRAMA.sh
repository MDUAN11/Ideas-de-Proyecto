#!/bin/bash
#$ -l h_rt=01:00:00,h_data=2G
#$ -pe shared 1
#$ -N GENES
#$ -cwd
#$ -o /u/scratch/d/dechavez/Bioinformatica-PUCE/HerrBio/MOLS/IDEA-DE-PROYECTO/logs/descarga.out
#$ -e /u/scratch/d/dechavez/Bioinformatica-PUCE/HerrBio/MOLS/IDEA-DE-PROYECTO/logs/descarga.err
#$ -M dechavezv

# Ir al directorio del proyecto
cd /u/scratch/d/dechavez/Bioinformatica-PUCE/HerrBio/MOLS/IDEA-DE-PROYECTO

# Crear carpeta de destino si no existe
mkdir -p SECUENCIA

# Descargar gen ortólogo FAP
./datasets download gene symbol FAP --ortholog Boidae --filename FAP_Boidae.zip

# Descomprimir archivo
unzip -o FAP_Boidae.zip

# Mover y renombrar el archivo .fna a la carpeta SECUENCIA
cp ncbi_dataset/data/rna.fna SECUENCIA/FAP.fa

# Limpiar archivos temporales
rm -rf ncbi_dataset FAP_Boidae.zip

# Descargar gen ortólogo FMNL2
./datasets download gene symbol FMNL2 --ortholog Boidae --filename FMNL2_Boidae.zip
unzip -o FMNL2_Boidae.zip
cp ncbi_dataset/data/rna.fna SECUENCIA/FMNL2.fa
rm -rf ncbi_dataset FMNL2_Boidae.zip

# Descargar gen ortólogo IFIH1
./datasets download gene symbol IFIH1 --ortholog Boidae --filename IFIH1_Boidae.zip
unzip -o IFIH1_Boidae.zip
cp ncbi_dataset/data/rna.fna SECUENCIA/IFIH1.fa
rm -rf ncbi_dataset IFIH1_Boidae.zip
