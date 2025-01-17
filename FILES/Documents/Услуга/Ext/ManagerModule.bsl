﻿
#Область Отчеты

// Заполняет список команд отчетов.
// 
// Параметры:
//   КомандыОтчетов - ТаблицаЗначений - состав полей см. в функции МенюОтчеты.СоздатьКоллекциюКомандОтчетов
//
Процедура ДобавитьКомандыОтчетов(КомандыОтчетов, Параметры = Неопределено) Экспорт

	УправляемыеФормыМодульМенеджера.ДобавитьКомандуСтруктураПодчиненности("ВариантыОтчетовУТПереопределяемый", КомандыОтчетов);
	УправляемыеФормыМодульМенеджера.ДобавитьКомандуДвиженияДокумента("ВариантыОтчетовУТПереопределяемый", КомандыОтчетов);	
	
	МодульМенеджераОбъектыСервер.ДобавитьКомандыОтчетов("Услуга", КомандыОтчетов);
		
КонецПроцедуры

// Заполняет список команд печати.
// 
// Параметры:
//   КомандыПечати - ТаблицаЗначений - состав полей см. в функции УправлениеПечатью.СоздатьКоллекциюКомандПечати
//
Процедура ДобавитьКомандыПечати(КомандыПечати, Параметры = Неопределено) Экспорт
	//	
	МодульМенеджераОбъектыСервер.ДобавитьКомандыПечати("Услуга", КомандыПечати);
	
КонецПроцедуры

// Заполняет список команд создания на основании.
// 
// Параметры:
//   КомандыСоздатьНаОсновании - ТаблицаЗначений - состав полей см. в функции ВводНаОсновании.СоздатьКоллекциюКомандСоздатьНаОсновании
//
Процедура ДобавитьКомандыСозданияНаОсновании(КомандыСоздатьНаОсновании, Параметры = Неопределено) Экспорт
	
	Документы.Услуга.ДобавитьКомандуСоздатьЗаказКлиентаБТНаОсновании(КомандыСоздатьНаОсновании);
	Документы.Услуга.ДобавитьКомандуВключитьВЗаказКлиентаБТНаОсновании(КомандыСоздатьНаОсновании);
	Документы.Услуга.ДобавитьКомандуОтменаБронированияНаОсновании(КомандыСоздатьНаОсновании);
	
	МодульМенеджераОбъектыСервер.ДобавитьКомандыСозданияНаОсновании("Услуга", КомандыСоздатьНаОсновании);
	
КонецПроцедуры

// Заполняет список команд создания на основании.
// 
// Параметры:
//   КомандыСоздатьНаОсновании - ТаблицаЗначений - состав полей см. в функции ВводНаОсновании.СоздатьКоллекциюКомандСоздатьНаОсновании
//
// Возвращаемое значение:
//	 КомандыСоздатьНаОсновании - ТаблицаЗначений - состав полей см. в функции ВводНаОсновании.СоздатьКоллекциюКомандСоздатьНаОсновании
//
Функция ДобавитьКомандуСоздатьЗаказКлиентаБТНаОсновании(КомандыСоздатьНаОсновании) Экспорт
		
	КомандаСоздатьНаОсновании = КомандыСоздатьНаОсновании.Добавить();
	КомандаСоздатьНаОсновании.Обработчик = "УправлениеБТКлиент.СоздатьЗаказКлиента";
	КомандаСоздатьНаОсновании.Идентификатор = Метаданные.Документы.ЗаказКлиентаБТ.ПолноеИмя();
	//КомандаСоздатьНаОсновании.Менеджер = Метаданные.Документы.ЗаказКлиентаБТ.ПолноеИмя();
	КомандаСоздатьНаОсновании.Представление = "Создать Заказ клиента (БТ)";
	КомандаСоздатьНаОсновании.РежимЗаписи = "Проводить";
	КомандаСоздатьНаОсновании.МножественныйВыбор = Истина;
	
	//КомандаСоздатьНаОсновании.Видимость = Истина;
	//КомандаСоздатьНаОсновании.ПроверкаПроведенияПередСозданиемНаОсновании = Истина;
	//КомандаСоздатьНаОсновании.РежимИспользованияПараметра = РежимИспользованияПараметраКоманды.Множественный;
	
	Возврат КомандаСоздатьНаОсновании;
		
КонецФункции

Функция ДобавитьКомандуВключитьВЗаказКлиентаБТНаОсновании(КомандыСоздатьНаОсновании) Экспорт
	 
	КомандаСоздатьНаОсновании = КомандыСоздатьНаОсновании.Добавить();
	КомандаСоздатьНаОсновании.Обработчик = "УправлениеБТКлиент.ВключитьУслугуВЗаказКлиента";
	КомандаСоздатьНаОсновании.Идентификатор = Метаданные.Документы.ЗаказКлиентаБТ.ПолноеИмя();
	КомандаСоздатьНаОсновании.Представление = "Включить в Заказ клиента (БТ)";
	КомандаСоздатьНаОсновании.МножественныйВыбор = Истина;
	
	//КомандаСоздатьНаОсновании.Видимость = Истина;
	//КомандаСоздатьНаОсновании.ПроверкаПроведенияПередСозданиемНаОсновании = Истина;
	//КомандаСоздатьНаОсновании.РежимИспользованияПараметра = РежимИспользованияПараметраКоманды.Множественный;
	
	Возврат КомандаСоздатьНаОсновании;
		
КонецФункции

Функция ДобавитьКомандуОтменаБронированияНаОсновании(КомандыСоздатьНаОсновании) Экспорт
	
	Если ПолучитьФункциональнуюОпцию("ИспользоватьБронированиеУслуг") Тогда
		КомандаСоздатьНаОсновании = КомандыСоздатьНаОсновании.Добавить();
		КомандаСоздатьНаОсновании.Обработчик = "УправлениеБТКлиент.ОтменитьБронированиеУслуги";
		КомандаСоздатьНаОсновании.Идентификатор = Метаданные.Документы.Услуга.ПолноеИмя();
		КомандаСоздатьНаОсновании.Представление = "Отменить бронирование услуги";
		КомандаСоздатьНаОсновании.МножественныйВыбор = Ложь;
		
		//КомандаСоздатьНаОсновании.Видимость = Истина;
		//КомандаСоздатьНаОсновании.ПроверкаПроведенияПередСозданиемНаОсновании = Истина;
		//КомандаСоздатьНаОсновании.РежимИспользованияПараметра = РежимИспользованияПараметраКоманды.Множественный;
	КонецЕсли;
	
	Возврат КомандаСоздатьНаОсновании;
		
КонецФункции

#КонецОбласти 


Процедура ОбработкаПолученияФормы(ВидФормы, Параметры, ВыбраннаяФорма, ДополнительнаяИнформация, СтандартнаяОбработка)
	
	ТипМодуля = "Документ.Услуга"; 
	МодульМенеджераОбъектыСервер.ОбработкаПолученияФормы(ТипМодуля, ВидФормы, Параметры, ВыбраннаяФорма, ДополнительнаяИнформация, СтандартнаяОбработка, "Начало");
	//Вставить содержимое обработчика
	МодульМенеджераОбъектыСервер.ОбработкаПолученияФормы(ТипМодуля, ВидФормы, Параметры, ВыбраннаяФорма, ДополнительнаяИнформация, СтандартнаяОбработка, "Конец");
	
КонецПроцедуры

Процедура ОбработкаПолученияДанныхВыбора(ДанныеВыбора, Параметры, СтандартнаяОбработка)
	
	ТипМодуля = "Документ.Услуга";
	МодульМенеджераОбъектыСервер.ОбработкаПолученияДанныхВыбора(ТипМодуля, ДанныеВыбора, Параметры, СтандартнаяОбработка, "Начало");
	// Вставить содержимое обработчика.
	МодульМенеджераОбъектыСервер.ОбработкаПолученияДанныхВыбора(ТипМодуля, ДанныеВыбора, Параметры, СтандартнаяОбработка, "Конец");
	
КонецПроцедуры

Процедура ОбработкаПолученияПолейПредставления(Поля, СтандартнаяОбработка)
	
	ТипМодуля = "Документ.Услуга";
	МодульМенеджераОбъектыСервер.ОбработкаПолученияПолейПредставления(ТипМодуля, Поля, СтандартнаяОбработка, "Начало");
	// Вставить содержимое обработчика.
	МодульМенеджераОбъектыСервер.ОбработкаПолученияПолейПредставления(ТипМодуля, Поля, СтандартнаяОбработка, "Конец");
	
КонецПроцедуры

Процедура ОбработкаПолученияПредставления(Данные, Представление, СтандартнаяОбработка)
	
	ТипМодуля = "Документ.Услуга";
	МодульМенеджераОбъектыСервер.ОбработкаПолученияПредставления(ТипМодуля, Данные, Представление, СтандартнаяОбработка, "Начало");
	// Вставить содержимое обработчика.
	МодульМенеджераОбъектыСервер.ОбработкаПолученияПредставления(ТипМодуля, Данные, Представление, СтандартнаяОбработка, "Конец");
	
КонецПроцедуры



Функция ПолучитьСтруктуруJSON() Экспорт
	
	Результат = Новый Структура();
	Макет = Документы.Услуга.ПолучитьМакет("JSONИмена");
	
	ТекущаяСтрока = 1;
	ВыполнятьЗагрузку = Истина;
	Пока ВыполнятьЗагрузку Цикл
		ТекущаяСтрока = ТекущаяСтрока + 1;
		
		Ключ = Макет.Область(ТекущаяСтрока, 1, ТекущаяСтрока, 1).Текст;
		Значение = Макет.Область(ТекущаяСтрока, 2, ТекущаяСтрока, 2).Текст;
		ИмяФункции = Макет.Область(ТекущаяСтрока, 3, ТекущаяСтрока, 3).Текст;
		
		Если Ключ = "" Тогда
			ВыполнятьЗагрузку = Ложь;
		Иначе
			Попытка
				Если ИмяФункции <> "" Тогда
					СсылкаНаФункцию = Справочники.ФункцииОписания[ИмяФункции];
				Иначе
					СсылкаНаФункцию = Справочники.ФункцииОписания.ПустаяСсылка();
				КонецЕсли;
				
				Результат.Вставить(Ключ, Новый Структура("Реквизит, КакЗаполнять", Значение, СсылкаНаФункцию));
			Исключение
			КонецПопытки;
		КонецЕсли;
			
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции


Функция ПолучитьСтруктуруРеквизитов() Экспорт
	
	Результат = Новый Структура();
	Макет = Документы.Услуга.ПолучитьМакет("JSONИмена");
	
	ТекущаяСтрока = 1;
	ВыполнятьЗагрузку = Истина;
	Пока ВыполнятьЗагрузку Цикл
		ТекущаяСтрока = ТекущаяСтрока + 1;
		
		Ключ = Макет.Область(ТекущаяСтрока, 2, ТекущаяСтрока, 2).Текст;
		Значение = Макет.Область(ТекущаяСтрока, 1, ТекущаяСтрока, 1).Текст;
		ИмяФункции = Макет.Область(ТекущаяСтрока, 3, ТекущаяСтрока, 3).Текст;
		
		Если Ключ = "" Тогда
			ВыполнятьЗагрузку = Ложь;
		Иначе
			Попытка
				Если ИмяФункции <> "" Тогда
					СсылкаНаФункцию = Справочники.ФункцииОписания[ИмяФункции];
				Иначе
					СсылкаНаФункцию = Справочники.ФункцииОписания.ПустаяСсылка();
				КонецЕсли;
				
				Результат.Вставить(Ключ, Новый Структура("Реквизит, ФункцияПоУмолчанию", Значение, СсылкаНаФункцию));
			Исключение
			КонецПопытки;
		КонецЕсли;
			
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции
