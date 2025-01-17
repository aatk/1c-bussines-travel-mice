﻿
Функция ВыполнитьПервоначальныйЗапуск(СсылкаНаДФ) Экспорт
	
	СписокОбработчиков = Новый Массив();
	
	Если БезопасныйРежим() = ЛОЖЬ Тогда
		Слеш = ПолучитьРазделительПутиСервера();
		ВременнаяДиректория = КаталогВременныхФайлов() + "i4b" + Слеш;
			
		РезПодключения = МаркетПлейсПовтИспользование.ОбработкаМП(СсылкаНаДФ);
		ОшибкаОбработки = РезПодключения.ОшибкаОбработки;
		ВОбработка = РезПодключения.ВОбработка;
		ИмяОбработки = РезПодключения.ИмяОбработки;
					
		Если НЕ ОшибкаОбработки Тогда
			Попытка
				Состояние = ВОбработка.ПервоначальныйЗапуск();
			Исключение
				Состояние = Новый Структура("Результат, Сообщение", Ложь, "Нет обработки первоначального запуска");
			КонецПопытки;
		КонецЕсли;		
	КонецЕсли;
	
	Возврат Состояние; 
КонецФункции

Функция СписокСобытий(СсылкаНаДФ) Экспорт
	
	СписокОбработчиков = Новый Массив();
	
	Если СсылкаНаДФ.ТипДопФункционала = Перечисления.ТипыДополнительногоФункционала.КомпонентСобытий Тогда
		Если БезопасныйРежим() = ЛОЖЬ Тогда
			Слеш = ПолучитьРазделительПутиСервера();
			ВременнаяДиректория = КаталогВременныхФайлов() + "i4b" + Слеш;
				
			РезПодключения = МаркетПлейсПовтИспользование.ОбработкаМП(СсылкаНаДФ);
			ОшибкаОбработки = РезПодключения.ОшибкаОбработки;
			ВОбработка = РезПодключения.ВОбработка;
			ИмяОбработки = РезПодключения.ИмяОбработки;
						
			Если НЕ ОшибкаОбработки Тогда
				Сведения = ВОбработка.СведенияОВнешнейОбработке();
				Для Каждого Команда ИЗ Сведения.Команды Цикл
					СписокОбработчиков.Добавить(Новый Структура ("ПутьКОбъектуМетаданных, ОбрабатываемоеСобытие, ДополнительноеДействие", Команда.Назначение, Команда.Событие, Команда.ДополнительноеДействие));
				КонецЦикла;
			КонецЕсли;		
		КонецЕсли;
	Иначе
		Сообщить("События поддерживаются только в компонентах с типом ""Компонент событий""");	
	КонецЕсли;
	
	Возврат СписокОбработчиков; 
КонецФункции

Функция УстановитьКЕШСеанса() Экспорт
	
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
	               |	ДополнительныйФункционалСписокОбрабатываемыхСобытий.ПутьКОбъектуМетаданных КАК ПутьКОбъектуМетаданных,
	               |	ДополнительныйФункционалСписокОбрабатываемыхСобытий.ОбрабатываемоеСобытие КАК ОбрабатываемоеСобытие,
	               |	ДополнительныйФункционалСписокОбрабатываемыхСобытий.Ссылка КАК Ссылка
	               |ИЗ
	               |	Справочник.ДополнительныйФункционал.СписокОбрабатываемыхСобытий КАК ДополнительныйФункционалСписокОбрабатываемыхСобытий
	               |ГДЕ
	               |	ДополнительныйФункционалСписокОбрабатываемыхСобытий.Ссылка.ТипДопФункционала = ЗНАЧЕНИЕ(Перечисление.ТипыДополнительногоФункционала.КомпонентСобытий)";
	Выгрузка = Запрос.Выполнить().Выгрузить();
	
	КЕШ = Новый Массив;
	Для Каждого СтрокаКЕШ ИЗ Выгрузка Цикл
		КЕШ.Добавить(ТЗВСтруктуру(Выгрузка, СтрокаКЕШ));
	КонецЦикла;
	
	Возврат КЕШ;	
КонецФункции

Функция СписокОбработчиков(Событие, Параметры) Экспорт
	
	СписокОбработчиков = Новый Массив();
	
	Если БезопасныйРежим() = ЛОЖЬ Тогда
		ИмяФормы = Параметры.ЭтаФорма;
		ДополнительноеДействие = Параметры.ДополнительноеДействие;
		
		Слеш = ПолучитьРазделительПутиСервера();
		ВременнаяДиректория = КаталогВременныхФайлов() + "i4b" + Слеш;
		
		ДетальныеЗаписи = МаркетПлейсПовтИспользование.СписокДопФункционалаМП();
		Для Каждого ВыборкаДетальныеЗаписи ИЗ ДетальныеЗаписи Цикл
			
			РезПодключения = МаркетПлейсПовтИспользование.ОбработкаМП(ВыборкаДетальныеЗаписи.Ссылка);
			ОшибкаОбработки = РезПодключения.ОшибкаОбработки;
			ВОбработка = РезПодключения.ВОбработка;
			ИмяОбработки = РезПодключения.ИмяОбработки;
						
			Если НЕ ОшибкаОбработки Тогда
				Сведения = ВОбработка.СведенияОВнешнейОбработке();
				Для Каждого Команда ИЗ Сведения.Команды Цикл
					// 
					Если (Команда.Событие = Событие ИЛИ Команда.Событие = "") И 
						(Команда.Назначение = ИмяФормы ИЛИ Команда.Назначение = "") И 
						(Команда.ДополнительноеДействие = ДополнительноеДействие ИЛИ Команда.ДополнительноеДействие = "")Тогда
						//
						Если Команда.Модуль = "Сервер" Тогда 
							СписокОбработчиков.Добавить(Новый Структура("Обработка, Команда", ВОбработка, Команда));
						Иначе
							КомандаКлиент = ТЗВСтруктуру(Сведения.Команды, Команда);
							СписокОбработчиков.Добавить(Новый Структура("Обработка, Команда", ИмяОбработки, КомандаКлиент));
						КонецЕсли;
					КонецЕсли;
				КонецЦикла;
			КонецЕсли;
			
		КонецЦикла;
	КонецЕсли;
	
	Возврат СписокОбработчиков; 
КонецФункции

Функция ПодключитьОбработку(СсылкаНаОбработку, Событие, Параметры) Экспорт
	
	Обработчик = Новый Структура("Обработка, Команда");
	
	Если БезопасныйРежим() = ЛОЖЬ Тогда
		ИмяФормы = Параметры.ЭтаФорма;
		ДополнительноеДействие = Параметры.ДополнительноеДействие;
		
		Слеш = ПолучитьРазделительПутиСервера();
		ВременнаяДиректория = КаталогВременныхФайлов() + "i4b" + Слеш;
		
		РезПодключения = МаркетПлейсПовтИспользование.ОбработкаМП(СсылкаНаОбработку);
		ОшибкаОбработки = РезПодключения.ОшибкаОбработки;
		ВОбработка = РезПодключения.ВОбработка;
		ИмяОбработки = РезПодключения.ИмяОбработки;
					
		Если НЕ ОшибкаОбработки Тогда
			Сведения = ВОбработка.СведенияОВнешнейОбработке();
			Для Каждого Команда ИЗ Сведения.Команды Цикл
				// 
				Если (Команда.Событие = Событие ИЛИ Команда.Событие = "") И 
					(Команда.Назначение = ИмяФормы ИЛИ Команда.Назначение = "") И 
					(Команда.ДополнительноеДействие = ДополнительноеДействие ИЛИ Команда.ДополнительноеДействие = "")Тогда
					//
					Если Команда.Модуль = "Сервер" Тогда 
						Обработчик = Новый Структура("Обработка, Команда", ВОбработка, Команда);
					Иначе
						КомандаКлиент = ТЗВСтруктуру(Сведения.Команды, Команда);
						Обработчик = Новый Структура("Обработка, Команда", ИмяОбработки, КомандаКлиент);
					КонецЕсли;
				КонецЕсли;
			КонецЦикла;
		КонецЕсли;
			
	КонецЕсли;
	
	Возврат Обработчик; 
КонецФункции


Функция ТЗВСтруктуру(ТаблицаЗ, СтрокаТЗ)
	
	НоваяСтрока = Новый Структура; 
	Для Каждого КолонкаТЗ ИЗ ТаблицаЗ.Колонки Цикл
		НоваяСтрока.Вставить(КолонкаТЗ.Имя, СтрокаТЗ[КолонкаТЗ.Имя]); 
	КонецЦикла;
	
	Возврат НоваяСтрока; 
КонецФункции
