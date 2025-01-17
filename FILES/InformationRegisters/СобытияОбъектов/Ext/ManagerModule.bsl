﻿
Функция ЗагрузитьПредопределенныеЗначения() Экспорт
	
	Макет = РегистрыСведений.СобытияОбъектов.ПолучитьМакет("ПредопределенныеЗначения");
	
	ТекущаяСтрока = 1;
	ВыполнятьЗагрузку = Истина;
	Пока ВыполнятьЗагрузку Цикл
		ТекущаяСтрока = ТекущаяСтрока + 1;
		
		ОбъектСобытия = Макет.Область(ТекущаяСтрока, 1, ТекущаяСтрока, 1).Текст;
		Событие = Макет.Область(ТекущаяСтрока, 2, ТекущаяСтрока, 2).Текст;
		Обработчик = Макет.Область(ТекущаяСтрока, 3, ТекущаяСтрока, 3).Текст;
		
		Если ОбъектСобытия = "" Тогда
			ВыполнятьЗагрузку = Ложь;
		Иначе
			Попытка
				//Метаданные.Справочники.ФункцииОписания.Предопределенные
				МЗ = РегистрыСведений.СобытияОбъектов.СоздатьМенеджерЗаписи();
				МЗ.ОбъектСобытия = ПланыВидовХарактеристик.НаборХарактеристикДляНоменклатуры[ОбъектСобытия]; //Ненавижу составные поля (( 
				МЗ.Событие = Перечисления.СобытияБТ[Событие];
				МЗ.Обработчик = Справочники.ФункцииОписания[Обработчик];
				МЗ.Записать(Истина);
			Исключение
			КонецПопытки;
		КонецЕсли;
			
	КонецЦикла;
	
КонецФункции
