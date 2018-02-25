-- Transcripción de Hoja de formulas simples de matematicas. Programa de Ejemplo para
-- materia "Paradigmas de Lenguajes de Programación"

import Data.List
import Data.Map (Map)
-- Formula Resolvente, Toma valores a b c de un polinomio de grado 2 y devuelve sus raices. 
resolvente ::  Double -> Double -> Double -> (Double, Double)
resolvente a b c = ( ((-b + (sqrt ((b^2) - ((4 * a) * c )))) / (2 * a)) , ((-b - (sqrt ((b^2) - ((4 * a) * c )))) / (2 * a)) )

-- Distancia Entre 2 Puntos: Toma 2 puntos (una tupla con coordenadas) y devuelve la distancia entre estos en R2.
distanciaEntrePuntos :: (Double, Double) -> (Double, Double) -> Double
distanciaEntrePuntos (x1, y1) (x2, y2) = sqrt ( diffAlCuadrado x1 x2 + diffAlCuadrado y1 y2 )

-- Distancia Entre 2 Puntos: Toma 2 puntos (una tupla con coordenadas) y devuelve la distancia entre  estos en R3.
distanciaEntrePuntosR3 :: (Double, Double, Double) -> (Double, Double, Double) -> Double
distanciaEntrePuntosR3 (x1, y1, z1) (x2, y2, z2)  = sqrt ( diffAlCuadrado x1 x2 +  diffAlCuadrado y1 y2 + diffAlCuadrado z1 z2 )

-- Fuciones Estadisticas
-- Media aritmetica.
media :: (Floating a) => [a] -> a  --Uso clase de tipo para definir todos los valores de la lista se comportan como números decimales
media [] = 0.0
media ls = sum ls / fromIntegral (length ls) --sum y length son funciones para operar con listas

--Mediana: De una conjunto de elementos ordenados devuelve el valor que se encuentra exactamente en medio, si la cantidad es par devuelve la suma de ambos valores medios
mediana :: (Floating a, Ord a) => [a] -> a  --Uso clase de tipo para definir todos los valores de la lista se comportan como números decimales y además poseen un orden 
mediana [] = 0.0
mediana ls 
        | odd $ length ls = head $ drop (length ls `div` 2) lsOrdenada  --Utilizamos Guardas para evaluar un valor de la lista, odd verifica si es impar. 'div' division entera.
        | even $ length ls = media $ take 2 $ drop ((length ls `div` 2) - 1) lsOrdenada --even verifica si es par.
        where lsOrdenada = quickSort ls

--Frecuencias
frecuencias :: Ord a => [a] -> [(a,Int)]  --Devuelve una tupla de valores del tipo (valor, conteo)
frecuencias ls = [(x,1 + length ls) | (x:ls) <- group (sort ls)]

--moda: De una lista de Valores devuelve el o los valores que más se repiten.
moda :: Ord a => [a] -> [a]
moda ls = [y | (y,n) <- lsf, n == m] --Listas Intencionales <- oprador de extracción del conjunto de la derecha.
    where lsf = frecuencias ls
          m  = maximum (map snd lsf) --snd retorna el segundo elemento de una tupla
--Esto se leeria mas o menos de la siguiente manera: Dado una lista ls se devuelve un valor 'y' que proviene de una tupla (y,n)
--la cual fue extraída de una lista de frecuencias (de la lista original) donde el segundo valor de la tupla es igual al maximo valor de todos
--los segundos elementos de la lista de frecuencias.


--La desviación media es la media aritmética de los valores absolutos de las desviaciones respecto a la media.
--La desviación respecto a la media es la diferencia en valor absoluto entre cada valor de la variable estadística y la media aritmética.
desviacionMedia :: (Floating a, Ord a) => [a] -> a
desviacionMedia ls = (sum $ restaDeCadaValorPorLaMedia) / fromIntegral cantDeMuestras
    where restaDeCadaValorPorLaMedia = map  (\x -> (x - (media ls)) * (signum (x - (media ls)))) ls
          cantDeMuestras = length ls

--La desviación típica es la raíz cuadrada de la varianza.
--Es decir, la raíz cuadrada de la media de los cuadrados de las puntuaciones de desviación.
desviacionTipica :: (Floating a, Ord a) => [a] -> a
desviacionTipica ls = sqrt $ varianza ls

--La varianza es la media aritmética del cuadrado de las desviaciones respecto a la media de una distribución estadística.
varianza :: (Floating a, Ord a) => [a] -> a
varianza ls = (sum $ restaDeCadaValorPorLaMediaYElevoCuadrado) / fromIntegral cantDeMuestras
    where restaDeCadaValorPorLaMediaYElevoCuadrado = map  (\x -> (x - (media ls)) ^ 2) ls
          cantDeMuestras = length ls

--Funciones de Soporte
valoresHastaElMedio :: (Integral a) => [a] -> a
valoresHastaElMedio ls = fromIntegral $ (length ls) + 1

diffAlCuadrado :: Double -> Double -> Double
diffAlCuadrado p1 p2 = (p2 - p1) ^2

--Toma de lista y devuelve un 0 si su cantidad es Par y un 1 si es impar
cantPar_o_Impar :: [a] -> Int
cantPar_o_Impar ls 
    | (length ls `mod` 2) == 0 = 0 --Par
    | otherwise = 1 --Impar

--Funcion de ordenamiento, stack overflow
quickSort :: Ord a => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = 
    quickSort menores ++ [x] ++ quickSort mayores --Concatenación
    where menores = [y | y <- xs, y <= x] --Listas Intencionales <- oprador de extracción del conjunto de la derecha.
          mayores = [y | y <- xs, y >  x] 
