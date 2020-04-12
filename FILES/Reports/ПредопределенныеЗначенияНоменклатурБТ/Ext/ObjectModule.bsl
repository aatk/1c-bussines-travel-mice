﻿//Процедура ПриКомпоновкеРезультата(ДокументРезультат, ДанныеРасшифровки, СтандартнаяОбработка)
//    
//    
//    СтандартнаяОбработка = Ложь; // отключаем стандартный вывод отчета - будем выводить программно
//    Настройки = КомпоновщикНастроек.ПолучитьНастройки(); 
//    
//    //++Расшифровка
//    ДанныеРасшифровки = новый ДанныеРасшифровкиКомпоновкиДанных; 
//    //--
//    
//    КомпоновщикМакета = Новый КомпоновщикМакетаКомпоновкиДанных;
//     
//    СхемаКомпоновкиДанных = ПолучитьМакет("ОсновнаяСхемаКомпоновкиДанных");
//    МакетКомпоновки = КомпоновщикМакета.Выполнить(СхемаКомпоновкиДанных, Настройки,ДанныеРасшифровки);

//    //+получаем Параметры
//	//ПериодДокументовС = МакетКомпоновки.ЗначенияПараметров.ПериодС.Значение;
//	//ПериодДокументовПо = МакетКомпоновки.ЗначенияПараметров.ПериодПо.Значение;
//	//ПериодПервойЦеныС = МакетКомпоновки.ЗначенияПараметров.ПериодПервойЦеныС.Значение;
//	//ПериодПервойЦеныПо = МакетКомпоновки.ЗначенияПараметров.ПериодПервойЦеныПо.значение;
//    
//    ТЗ = ПолучитьТЗ();
//    
//    ВнешниеНаборыДанных = новый Структура();
//    ВнешниеНаборыДанных.Вставить("Таблица",ТЗ);
//    //-
//    
//    ПроцессорКомпоновки = Новый ПроцессорКомпоновкиДанных;
//    ПроцессорКомпоновки.Инициализировать(МакетКомпоновки,ВнешниеНаборыДанных,ДанныеРасшифровки);

//    ДокументРезультат.Очистить();
//     
//    ПроцессорВывода = Новый ПроцессорВыводаРезультатаКомпоновкиДанныхВТабличныйДокумент;
//    ПроцессорВывода.УстановитьДокумент(ДокументРезультат);     
//     
//    ПроцессорВывода.Вывести(ПроцессорКомпоновки);

//КонецПроцедуры

//Функция ПолучитьТЗ()
//	Запрос = Новый Запрос;
//	Запрос.Текст = "ВЫБРАТЬ
//	               |	ВЫРАЗИТЬ("""" КАК СТРОКА(250)) КАК УникальныйИдентификатор,
//	               |	НоменклатураБТ.Ссылка КАК Ссылка,
//	               |	НоменклатураБТ.Наименование КАК Наименование,
//	               |	НоменклатураБТ.Номенклатура КАК Номенклатура,
//	               |	НоменклатураБТ.ИспользуетсяВМаршруте КАК ИспользуетсяВМаршруте,
//	               |	НоменклатураБТ.СистемнаяНоменклатура КАК СистемнаяНоменклатура,
//	               |	ВЫРАЗИТЬ("""" КАК СТРОКА(250)) КАК Характеристика,
//	               |	ВЫРАЗИТЬ("""" КАК СТРОКА(250)) КАК Значение,
//	               |	НоменклатураБТХарактеристики.Характеристика КАК ХарактеристикаСсылка,
//	               |	НоменклатураБТХарактеристики.Характеристика.Наименование КАК ХарактеристикаНаименование,
//	               |	НоменклатураБТХарактеристики.ХранитьИсторию КАК ХранитьИсторию,
//	               |	НоменклатураБТХарактеристики.НеОтображать КАК НеОтображать,
//	               |	НоменклатураБТХарактеристики.ОбязательноеЗаполнение КАК ОбязательноеЗаполнение,
//	               |	НоменклатураБТХарактеристики.ЭмитироватьСправочник КАК ЭмитироватьСправочник
//	               |ИЗ
//	               |	Справочник.НоменклатураБТ КАК НоменклатураБТ
//	               |		ЛЕВОЕ СОЕДИНЕНИЕ Справочник.НоменклатураБТ.Характеристики КАК НоменклатураБТХарактеристики
//	               |		ПО (НоменклатураБТХарактеристики.Ссылка = НоменклатураБТ.Ссылка)
//	               |ГДЕ
//	               |	НЕ НоменклатураБТ.ПометкаУдаления";
//	Таблица = Запрос.Выполнить().Выгрузить();
//	Для Каждого ТекСтрока Из Таблица Цикл  
//		ТекСтрока.УникальныйИдентификатор = XMLСтрока(ТекСтрока.Ссылка);
//		МассивJson = Новый Массив;
//		Структура = Новый Структура("Характеристика, ХранитьИсторию, НеОтображать, ОбязательноеЗаполнение, ЭмитироватьСправочник", 
//			ТекСтрока.ХарактеристикаНаименование, 
//			ТекСтрока.ХранитьИсторию, 
//			ТекСтрока.НеОтображать, 
//			ТекСтрока.ОбязательноеЗаполнение, 
//			ТекСтрока.ЭмитироватьСправочник);
//		МассивJson.Добавить(Структура);
//		Попытка
//			ТекСтрока.Характеристика = УправлениеБТВызовСервера.ВJSON(МассивJson);
//			ТекСтрока.Значение = УправлениеБТВызовСервера.ВJSON(МассивJson);
//		Исключение
//			ТекСтрока.Характеристика = "";
//			ТекСтрока.Значение = "";
//		КонецПопытки;
//		
//	КонецЦикла;
//	Возврат Таблица
//КонецФункции