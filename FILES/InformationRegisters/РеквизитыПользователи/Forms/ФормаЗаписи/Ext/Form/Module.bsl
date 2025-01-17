﻿
&НаКлиенте
Процедура ВыполнитьПослеВыбораФайла(Пар1, Пар2) Экспорт
	
	Если ТипЗнч(Пар1) = Тип("Массив") Тогда
		
	    Для Каждого ИмяФайла Из Пар1 Цикл
			Файл = Новый Файл(ИмяФайла);
			Имя = Файл.Имя;
						
			ДД = Новый ДвоичныеДанные(ИмяФайла);
			Если Пар2 = "Факсимиле" Тогда
				СсылкаНаФайлВоВременномХранилище = ПоместитьВоВременноеХранилище(ДД, ЭтаФорма.УникальныйИдентификатор);
			ИначеЕсли Пар2 = "ФаксимилеПечать" Тогда
				СсылкаНаФайлВоВременномХранилищеПечать = ПоместитьВоВременноеХранилище(ДД, ЭтаФорма.УникальныйИдентификатор);
			ИначеЕсли Пар2 = "ФаксимилеПодпись" Тогда
				СсылкаНаФайлВоВременномХранилищеПодпись = ПоместитьВоВременноеХранилище(ДД, ЭтаФорма.УникальныйИдентификатор);
			КонецЕсли; 	
				
			Модифицированность = Истина; 
		КонецЦикла;
			
	Иначе
	    ПоказатьПредупреждение(,НСтр("ru = 'Файл не выбран!'; en = 'File not selected!'"));
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьОбработку(Команда)
	Режим = РежимДиалогаВыбораФайла.Открытие;
	ДиалогОткрытияФайла = Новый ДиалогВыбораФайла(Режим);
	ДиалогОткрытияФайла.ПолноеИмяФайла = "";
	Фильтр = "PNG (*.png)|*.png";
	
	ДиалогОткрытияФайла.Фильтр = Фильтр;
	ДиалогОткрытияФайла.МножественныйВыбор = Ложь;
	ДиалогОткрытияФайла.Заголовок = "Выберите файлы";
	
	Оп = Новый ОписаниеОповещения("ВыполнитьПослеВыбораФайла", ЭтотОбъект, "Факсимиле");
	ДиалогОткрытияФайла.Показать(Оп);
КонецПроцедуры


&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	
	Если ЭтоАдресВременногоХранилища(СсылкаНаФайлВоВременномХранилище) Тогда
		ДвоичныеДанные = ПолучитьИзВременногоХранилища(СсылкаНаФайлВоВременномХранилище);
		ТекущийОбъект.Факсимиле = Новый ХранилищеЗначения(ДвоичныеДанные, Новый СжатиеДанных(9));
	КонецЕсли;       
	Если ЭтоАдресВременногоХранилища(СсылкаНаФайлВоВременномХранилищеПечать) Тогда
		ДвоичныеДанные = ПолучитьИзВременногоХранилища(СсылкаНаФайлВоВременномХранилищеПечать);
		ТекущийОбъект.ФаксимилеПечать = Новый ХранилищеЗначения(ДвоичныеДанные, Новый СжатиеДанных(9));
	КонецЕсли;       
	Если ЭтоАдресВременногоХранилища(СсылкаНаФайлВоВременномХранилищеПодпись) Тогда
		ДвоичныеДанные = ПолучитьИзВременногоХранилища(СсылкаНаФайлВоВременномХранилищеПодпись);
		ТекущийОбъект.ФаксимилеПодпись = Новый ХранилищеЗначения(ДвоичныеДанные, Новый СжатиеДанных(9));
	КонецЕсли;
	
	Если ФаксимилеСчетСтандарт = "" Тогда
		ТекущийОбъект.Факсимиле = Неопределено; 
	ИначеЕсли ФаксимилеПечать = "" Тогда
		ТекущийОбъект.ФаксимилеПечать = Неопределено; 
	ИначеЕсли ФаксимилеПодпись = "" Тогда
		ТекущийОбъект.ФаксимилеПодпись = Неопределено; 
	КонецЕсли;

КонецПроцедуры

&НаСервере
Процедура ПриЗаписиНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	
	Если ЭтоАдресВременногоХранилища(СсылкаНаФайлВоВременномХранилище) Тогда
		УдалитьИзВременногоХранилища(СсылкаНаФайлВоВременномХранилище);
		СсылкаНаФайлВоВременномХранилище = "";
	КонецЕсли;
	Если ЭтоАдресВременногоХранилища(СсылкаНаФайлВоВременномХранилищеПечать) Тогда
		УдалитьИзВременногоХранилища(СсылкаНаФайлВоВременномХранилищеПечать);
		СсылкаНаФайлВоВременномХранилищеПечать = "";
	КонецЕсли;
	Если ЭтоАдресВременногоХранилища(СсылкаНаФайлВоВременномХранилищеПодпись) Тогда
		УдалитьИзВременногоХранилища(СсылкаНаФайлВоВременномХранилищеПодпись);
		СсылкаНаФайлВоВременномХранилищеПодпись = "";
	КонецЕсли;

	
КонецПроцедуры




&НаКлиенте
Процедура ОткрытьФаксимилеПечать(Команда)
	Режим = РежимДиалогаВыбораФайла.Открытие;
	ДиалогОткрытияФайла = Новый ДиалогВыбораФайла(Режим);
	ДиалогОткрытияФайла.ПолноеИмяФайла = "";
	Фильтр = "PNG (*.png)|*.png";
	
	ДиалогОткрытияФайла.Фильтр = Фильтр;
	ДиалогОткрытияФайла.МножественныйВыбор = Ложь;
	ДиалогОткрытияФайла.Заголовок = "Выберите файлы";
	
	Оп = Новый ОписаниеОповещения("ВыполнитьПослеВыбораФайла", ЭтотОбъект, "ФаксимилеПечать");
	ДиалогОткрытияФайла.Показать(Оп);
КонецПроцедуры

&НаКлиенте
Процедура ОткрытьФаксимилеПодпись(Команда)
	Режим = РежимДиалогаВыбораФайла.Открытие;
	ДиалогОткрытияФайла = Новый ДиалогВыбораФайла(Режим);
	ДиалогОткрытияФайла.ПолноеИмяФайла = "";
	Фильтр = "PNG (*.png)|*.png";
	
	ДиалогОткрытияФайла.Фильтр = Фильтр;
	ДиалогОткрытияФайла.МножественныйВыбор = Ложь;
	ДиалогОткрытияФайла.Заголовок = "Выберите файлы";
	
	Оп = Новый ОписаниеОповещения("ВыполнитьПослеВыбораФайла", ЭтотОбъект, "ФаксимилеПодпись");
	ДиалогОткрытияФайла.Показать(Оп);
КонецПроцедуры



&НаКлиенте
Процедура ОчиститьПечать(Команда)
	ФаксимилеПечать = "";
	Модифицированность = Истина; 
КонецПроцедуры

&НаКлиенте
Процедура ОчиститьПодпись(Команда)
	ФаксимилеПодпись = "";
	Модифицированность = Истина; 
КонецПроцедуры

&НаКлиенте
Процедура ОчиститьФаксимиле(Команда)
	ФаксимилеСчетСтандарт = "";
	Модифицированность = Истина; 
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка) 
	
	//ЗаписьНаСервере = РеквизитФормыВЗначение("Запись");
	ЗаписьНаСервере = РегистрыСведений.РеквизитыПользователи.СоздатьКлючЗаписи(Новый Структура("Пользователь", Запись.Пользователь));
	Если Не ЗаписьНаСервере.Пустой() Тогда
		ФаксимилеСчетСтандарт = ПолучитьНавигационнуюСсылку(ЗаписьНаСервере, "Факсимиле");
		ФаксимилеПечать = ПолучитьНавигационнуюСсылку(ЗаписьНаСервере, "ФаксимилеПечать");
		ФаксимилеПодпись = ПолучитьНавигационнуюСсылку(ЗаписьНаСервере, "ФаксимилеПодпись");
	КонецЕсли;
	
КонецПроцедуры
