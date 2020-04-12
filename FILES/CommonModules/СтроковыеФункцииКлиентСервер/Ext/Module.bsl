﻿
// Вставляет параметры в строку, учитывая, что в параметрах могут использоваться подстановочные слова %1, %2 и т.д.
Функция ПодставитьПараметрыСПроцентом(Знач СтрокаПодстановки,
	Знач Параметр1, Знач Параметр2 = Неопределено, Знач Параметр3 = Неопределено,
	Знач Параметр4 = Неопределено, Знач Параметр5 = Неопределено, Знач Параметр6 = Неопределено,
	Знач Параметр7 = Неопределено, Знач Параметр8 = Неопределено, Знач Параметр9 = Неопределено)
	
	Результат = "";
	Позиция = СтрНайти(СтрокаПодстановки, "%");
	Пока Позиция > 0 Цикл 
		Результат = Результат + Лев(СтрокаПодстановки, Позиция - 1);
		СимволПослеПроцента = Сред(СтрокаПодстановки, Позиция + 1, 1);
		ПодставляемыйПараметр = Неопределено;
		Если СимволПослеПроцента = "1" Тогда
			ПодставляемыйПараметр = Параметр1;
		ИначеЕсли СимволПослеПроцента = "2" Тогда
			ПодставляемыйПараметр = Параметр2;
		ИначеЕсли СимволПослеПроцента = "3" Тогда
			ПодставляемыйПараметр = Параметр3;
		ИначеЕсли СимволПослеПроцента = "4" Тогда
			ПодставляемыйПараметр = Параметр4;
		ИначеЕсли СимволПослеПроцента = "5" Тогда
			ПодставляемыйПараметр = Параметр5;
		ИначеЕсли СимволПослеПроцента = "6" Тогда
			ПодставляемыйПараметр = Параметр6;
		ИначеЕсли СимволПослеПроцента = "7" Тогда
			ПодставляемыйПараметр = Параметр7
		ИначеЕсли СимволПослеПроцента = "8" Тогда
			ПодставляемыйПараметр = Параметр8;
		ИначеЕсли СимволПослеПроцента = "9" Тогда
			ПодставляемыйПараметр = Параметр9;
		КонецЕсли;
		Если ПодставляемыйПараметр = Неопределено Тогда
			Результат = Результат + "%";
			СтрокаПодстановки = Сред(СтрокаПодстановки, Позиция + 1);
		Иначе
			Результат = Результат + ПодставляемыйПараметр;
			СтрокаПодстановки = Сред(СтрокаПодстановки, Позиция + 2);
		КонецЕсли;
		Позиция = СтрНайти(СтрокаПодстановки, "%");
	КонецЦикла;
	Результат = Результат + СтрокаПодстановки;
	
	Возврат Результат;
КонецФункции

// Подставляет параметры в строку. Максимально возможное число параметров - 9.
// Параметры в строке задаются как %<номер параметра>. Нумерация параметров начинается с единицы.
//
// Параметры:
//  ШаблонСтроки  - Строка - шаблон строки с параметрами (вхождениями вида "%<номер параметра>", 
//                           например, "%1 пошел в %2");
//  Параметр<n>   - Строка - значение подставляемого параметра.
//
// Возвращаемое значение:
//  Строка   - текстовая строка с подставленными параметрами.
//
// Пример:
//  СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(НСтр("ru='%1 пошел в %2'"), "Вася", "Зоопарк") = "Вася пошел
//  в Зоопарк".
//
Функция ПодставитьПараметрыВСтроку(Знач ШаблонСтроки,
	Знач Параметр1, Знач Параметр2 = Неопределено, Знач Параметр3 = Неопределено,
	Знач Параметр4 = Неопределено, Знач Параметр5 = Неопределено, Знач Параметр6 = Неопределено,
	Знач Параметр7 = Неопределено, Знач Параметр8 = Неопределено, Знач Параметр9 = Неопределено) Экспорт
	
	ЕстьПараметрыСПроцентом = СтрНайти(Параметр1, "%")
		Или СтрНайти(Параметр2, "%")
		Или СтрНайти(Параметр3, "%")
		Или СтрНайти(Параметр4, "%")
		Или СтрНайти(Параметр5, "%")
		Или СтрНайти(Параметр6, "%")
		Или СтрНайти(Параметр7, "%")
		Или СтрНайти(Параметр8, "%")
		Или СтрНайти(Параметр9, "%");
		
	Если ЕстьПараметрыСПроцентом Тогда
		Возврат ПодставитьПараметрыСПроцентом(ШаблонСтроки, Параметр1,
			Параметр2, Параметр3, Параметр4, Параметр5, Параметр6, Параметр7, Параметр8, Параметр9);
	КонецЕсли;
	
	ШаблонСтроки = СтрЗаменить(ШаблонСтроки, "%1", Параметр1);
	ШаблонСтроки = СтрЗаменить(ШаблонСтроки, "%2", Параметр2);
	ШаблонСтроки = СтрЗаменить(ШаблонСтроки, "%3", Параметр3);
	ШаблонСтроки = СтрЗаменить(ШаблонСтроки, "%4", Параметр4);
	ШаблонСтроки = СтрЗаменить(ШаблонСтроки, "%5", Параметр5);
	ШаблонСтроки = СтрЗаменить(ШаблонСтроки, "%6", Параметр6);
	ШаблонСтроки = СтрЗаменить(ШаблонСтроки, "%7", Параметр7);
	ШаблонСтроки = СтрЗаменить(ШаблонСтроки, "%8", Параметр8);
	ШаблонСтроки = СтрЗаменить(ШаблонСтроки, "%9", Параметр9);
	Возврат ШаблонСтроки;
	
КонецФункции


// Формирует и выводит сообщение, которое может быть связано с элементом 
// управления формы.
//
// Параметры:
//  ТекстСообщенияПользователю - Строка - текст сообщения.
//  КлючДанных                 - ЛюбаяСсылка - объект или ключ записи информационной базы, к которому это сообщение относится.
//  Поле                       - Строка - наименование реквизита формы.
//  ПутьКДанным                - Строка - путь к данным (путь к реквизиту формы).
//  Отказ                      - Булево - выходной параметр, всегда устанавливается в значение Истина.
//
// Пример:
//
//  1. Для вывода сообщения у поля управляемой формы, связанного с реквизитом объекта:
//  ОбщегоНазначенияКлиентСервер.СообщитьПользователю(
//   НСтр("ru = 'Сообщение об ошибке.'"), ,
//   "ПолеВРеквизитеФормыОбъект",
//   "Объект");
//
//  Альтернативный вариант использования в форме объекта:
//  ОбщегоНазначенияКлиентСервер.СообщитьПользователю(
//   НСтр("ru = 'Сообщение об ошибке.'"), ,
//   "Объект.ПолеВРеквизитеФормыОбъект");
//
//  2. Для вывода сообщения рядом с полем управляемой формы, связанным с реквизитом формы:
//  ОбщегоНазначенияКлиентСервер.СообщитьПользователю(
//   НСтр("ru = 'Сообщение об ошибке.'"), ,
//   "ИмяРеквизитаФормы");
//
//  3. Для вывода сообщения связанного с объектом информационной базы:
//  ОбщегоНазначенияКлиентСервер.СообщитьПользователю(
//   НСтр("ru = 'Сообщение об ошибке.'"), ОбъектИнформационнойБазы, "Ответственный",,Отказ);
//
//  4. Для вывода сообщения по ссылке на объект информационной базы:
//  ОбщегоНазначенияКлиентСервер.СообщитьПользователю(
//   НСтр("ru = 'Сообщение об ошибке.'"), Ссылка, , , Отказ);
//
//  Случаи некорректного использования:
//   1. Передача одновременно параметров КлючДанных и ПутьКДанным.
//   2. Передача в параметре КлючДанных значения типа отличного от допустимых.
//   3. Установка ссылки без установки поля (и/или пути к данным).
//
Процедура СообщитьПользователю(
		Знач ТекстСообщенияПользователю,
		Знач КлючДанных = Неопределено,
		Знач Поле = "",
		Знач ПутьКДанным = "",
		Отказ = Ложь) Экспорт
	
	Сообщение = Новый СообщениеПользователю;
	Сообщение.Текст = ТекстСообщенияПользователю;
	Сообщение.Поле = Поле;
	
	ЭтоОбъект = Ложь;
	
#Если НЕ ТонкийКлиент И НЕ ВебКлиент Тогда
	Если КлючДанных <> Неопределено
	   И XMLТипЗнч(КлючДанных) <> Неопределено Тогда
		ТипЗначенияСтрокой = XMLТипЗнч(КлючДанных).ИмяТипа;
		ЭтоОбъект = СтрНайти(ТипЗначенияСтрокой, "Object.") > 0;
	КонецЕсли;
#КонецЕсли
	
	Если ЭтоОбъект Тогда
		Сообщение.УстановитьДанные(КлючДанных);
	Иначе
		Сообщение.КлючДанных = КлючДанных;
	КонецЕсли;
	
	Если НЕ ПустаяСтрока(ПутьКДанным) Тогда
		Сообщение.ПутьКДанным = ПутьКДанным;
	КонецЕсли;
		
	Сообщение.Сообщить();
	
	Отказ = Истина;
	
КонецПроцедуры

// Добавляет в список ошибок новую ошибку пользователя для дальнейшей отправки с помощью
// процедуры СообщитьОшибкиПользователю().
// Предназначена для накопления списка ошибок с последующей обработкой этого списка перед тем, как вывести
// пользователю. Полученный список ошибок можно, например, отсортировать по важности, очистить от дублей,
// а также вывести пользователю в ином виде, чем выводит метод СообщитьПользователю, например, в табличный документ.
//
// Параметры:
//  Ошибки          - Неопределено - будет создан новый список,
//                  - значение, установленное при первом вызове этой процедуры со значением Неопределено.
//
//  ПолеОшибки      - Строка - значение, которое задается в свойстве Поле объекта СообщениеПользователю.
//                    Для автоподстановки номера строки должна содержать "%1".
//                    Например, "Объект.ИНН" или "Объект.Пользователи[%1].Пользователь".
//
//  ТекстДляОднойОшибки - Строка - текст ошибки для случая, когда ГруппаОшибок в коллекции только одна,
//                    например, НСтр("ru = 'Пользователь не выбран.'").
//
//  ГруппаОшибок    - Произвольный - используется для выбора либо текста для одной ошибки,
//                    либо текста для нескольких ошибок, например, имя "Объект.Пользователи".
//                    Если значение не заполнено, тогда используется текст для одной ошибки.
//
//  НомерСтроки     - Число - значение от 0 ... , определяющее номер строки, который нужно подставить
//                    в строку ПолеОшибки и в ТекстДляНесколькихОшибок (подставляется НомерСтроки + 1).
//
//  ТекстДляНесколькихОшибок - Строка - текст ошибки для случая, когда добавлено несколько ошибок с одинаковым
//                    свойством ГруппаОшибок, например, НСтр("ru = 'Пользователь в строке %1 не выбран.'").
//
//  ИндексСтроки    - Неопределено - совпадает со значением параметра НомерСтроки.
//                    Число - значение от 0 ... , определяющее номер строки, который нужно подставить
//                    в строку ПолеОшибки.
//
Процедура ДобавитьОшибкуПользователю(Ошибки, ПолеОшибки, ТекстДляОднойОшибки, ГруппаОшибок, НомерСтроки = 0, ТекстДляНесколькихОшибок = "", ИндексСтроки = Неопределено) Экспорт
	
	Если Ошибки = Неопределено Тогда
		Ошибки = Новый Структура;
		Ошибки.Вставить("СписокОшибок", Новый Массив);
		Ошибки.Вставить("ГруппыОшибок", Новый Соответствие);
	КонецЕсли;
	
	Если НЕ ЗначениеЗаполнено(ГруппаОшибок) Тогда
		// При незаполненной группе ошибок используется текст для одной ошибки.
	Иначе
		Если Ошибки.ГруппыОшибок[ГруппаОшибок] = Неопределено Тогда
			// Группа ошибок использовалась один раз, используется текст для одной ошибки.
			Ошибки.ГруппыОшибок.Вставить(ГруппаОшибок, Ложь);
		Иначе
			// Группа ошибок использовалась несколько раз, используется текст для нескольких ошибок.
			Ошибки.ГруппыОшибок.Вставить(ГруппаОшибок, Истина);
		КонецЕсли;
	КонецЕсли;
	
	Ошибка = Новый Структура;
	Ошибка.Вставить("ПолеОшибки",               ПолеОшибки);
	Ошибка.Вставить("ТекстДляОднойОшибки",      ТекстДляОднойОшибки);
	Ошибка.Вставить("ГруппаОшибок",             ГруппаОшибок);
	Ошибка.Вставить("НомерСтроки",              НомерСтроки);
	Ошибка.Вставить("ТекстДляНесколькихОшибок", ТекстДляНесколькихОшибок);
	Ошибка.Вставить("ИндексСтроки",             ИндексСтроки);
	
	Ошибки.СписокОшибок.Добавить(Ошибка);
	
КонецПроцедуры

// Выводит накопленные методом ДобавитьОшибкуПользователю ошибки, при этом использует нужные шаблоны текстов ошибок
// в зависимости от количества однотипных ошибок.
//
// Параметры:
//  Ошибки  - Неопределено, Структура - коллекция ошибок.
//  Отказ   - Булево - устанавливается Истина, если ошибки сообщались.
//
Процедура СообщитьОшибкиПользователю(Ошибки, Отказ = Ложь) Экспорт
	
	Если Ошибки = Неопределено Тогда
		Возврат;
	Иначе
		Отказ = Истина;
	КонецЕсли;
	
	Для каждого Ошибка Из Ошибки.СписокОшибок Цикл
		
		Если Ошибка.ИндексСтроки = Неопределено Тогда
			ИндексСтроки = Ошибка.НомерСтроки;
		Иначе
			ИндексСтроки = Ошибка.ИндексСтроки;
		КонецЕсли;
		
		Если Ошибки.ГруппыОшибок[Ошибка.ГруппаОшибок] <> Истина Тогда
			
			СообщитьПользователю(
				Ошибка.ТекстДляОднойОшибки,
				,
				СтрЗаменить(Ошибка.ПолеОшибки, "%1", Формат(ИндексСтроки, "ЧН=0; ЧГ=")));
		Иначе
			СообщитьПользователю(
				СтрЗаменить(Ошибка.ТекстДляНесколькихОшибок, "%1", Формат(Ошибка.НомерСтроки + 1, "ЧН=0; ЧГ=")),
				,
				СтрЗаменить(Ошибка.ПолеОшибки, "%1", Формат(ИндексСтроки, "ЧН=0; ЧГ=")));
		КонецЕсли;
	КонецЦикла;
	
КонецПроцедуры
