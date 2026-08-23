package §_-E1v§
{
   import §_-Al§.§_-4G§;
   import §_-Al§.§_-92M§;
   import §_-Al§.§_-HM§;
   import §_-Al§.§_-K1A§;
   import §_-Al§.§_-K1K§;
   import §_-Al§.§_-MC§;
   import §_-Al§.§_-R2L§;
   import §_-Al§.§_-YQ§;
   import §_-Al§.§_-o2G§;
   import §_-Al§.§_-q1O§;
   import §_-Al§.§_-r1g§;
   import §_-Al§.§_-tE§;
   import §_-Al§.§_-zz§;
   import flash.utils.Endian;
   import protocol.§_-s2l§;
   import protocol.§_-z1i§;
   
   public dynamic class §_-w1k§ implements §_-J2w§
   {
      
      public static const §_-W21§:int = 0;
      
      public static const §_-P26§:int = 0;
      
      public static const §_-FM§:int = 1;
      
      public static const §_-B3d§:int = 2;
      
      public static const SIZE:int = 3;
      
      public static const STATE:int = 4;
      
      public static const §_-03H§:int = 5;
      
      public static const §_-LS§:int = 6;
      
      public static const §_-I1N§:int = 7;
      
      public static const §_-x1i§:int = 8;
      
      public static const §_-t1d§:int = 9;
      
      public static const §_-x2Q§:int = 10;
      
      public static const §_-u2P§:int = 11;
      
      public static const §_-tV§:int = 12;
      
      public static const §_-11N§:int = 13;
      
      public static const §_-E2R§:int = 14;
      
      public static const §_-x2l§:int = 15;
      
      public static const §_-a1z§:int = 16;
      
      public static const §_-qV§:int = 17;
      
      private static var position:int = 0;
      
      public static const §_-R§:int = ++position;
      
      public static const §_-i13§:int = ++position;
      
      public static const §_-h2h§:int = ++position;
      
      public static const §_-an§:int = ++position;
      
      public static const §_-v2l§:int = ++position;
      
      public static const §_-91B§:int = ++position;
      
      public static const §_-g1q§:int = ++position;
      
      public static const §_-12W§:int = ++position;
      
      public static const §_-a2A§:int = ++position;
      
      public static const §_-82t§:int = ++position;
      
      public static const §_-Q13§:int = ++position;
      
      public static const §_-xT§:int = ++position;
      
      public static const §_-n27§:int = ++position;
      
      public static const §_-N1I§:int = ++position;
      
      public static const §_-H2n§:int = ++position;
      
      public static const §_-M1k§:int = ++position;
      
      public static const §_-N1j§:int = ++position;
      
      public static const §_-a7§:int = ++position;
      
      public static const §_-qG§:int = ++position;
      
      public static const §_-61T§:int = ++position;
      
      public static const §_-B1C§:int = ++position;
      
      public static const §_-33G§:int = ++position;
      
      public static const §_-S1F§:int = ++position;
      
      public static const §_-61f§:int = ++position;
      
      public static const §_-x28§:int = ++position;
      
      public static const §_-j2b§:int = ++position;
      
      public static const §_-61M§:int = ++position;
      
      public static const §_-g2k§:int = ++position;
      
      public static const §_-j13§:int = ++position;
      
      public static const §_-X2R§:Array = ["Инфо","Новости","Лидер","Размер","Статус","Ранг","Изменение ранга","Места","Бан","Тотемы","Ранги тотемов","Бонусы тотемов","Статистика","Чёрный лист","Опоры","Уровень входа","Баланс","Рейтинг"];
      
      private static var §_-W2V§:Array = null;
      
      private var §_-F2T§:Object = {};
      
      public var id:int = 0;
      
      private var _name:String = "";
      
      private var §_-91D§:String = "";
      
      public var §_-iV§:String = "";
      
      public function §_-w1k§()
      {
         super();
      }
      
      public static function §_-h2Z§(param1:§_-s2l§) : §_-w1k§
      {
         var _loc2_:§_-w1k§ = new §_-w1k§();
         _loc2_.id = param1[§_-R§];
         _loc2_._name = param1[§_-i13§];
         _loc2_.§_-91D§ = param1[§_-h2h§];
         _loc2_.§_-iV§ = param1[§_-an§];
         _loc2_.§_-J9§(§_-P26§,[param1[§_-i13§],param1[§_-h2h§],param1[§_-an§]]);
         _loc2_.§_-J9§(§_-FM§,[param1[§_-v2l§]]);
         _loc2_.§_-J9§(§_-B3d§,[param1[§_-91B§]]);
         _loc2_.§_-J9§(SIZE,[param1[§_-g1q§],param1[§_-n27§]]);
         _loc2_.§_-J9§(STATE,[param1[§_-12W§]]);
         _loc2_.§_-J9§(§_-03H§,[param1[§_-a2A§],param1[§_-82t§],param1[§_-Q13§]]);
         _loc2_.§_-J9§(§_-LS§,[param1[§_-xT§]]);
         _loc2_.§_-J9§(§_-I1N§,[param1[§_-n27§]]);
         _loc2_.§_-J9§(§_-x1i§,[param1[§_-N1I§]]);
         _loc2_.§_-J9§(§_-t1d§,{
            "slots":param1[§_-H2n§],
            "booster":param1[§_-M1k§]
         });
         _loc2_.§_-J9§(§_-x2Q§,param1[§_-N1j§]);
         _loc2_.§_-J9§(§_-u2P§,param1[§_-a7§]);
         _loc2_.§_-J9§(§_-tV§,param1[§_-qG§]);
         _loc2_.§_-J9§(§_-11N§,param1[§_-61T§]);
         _loc2_.§_-J9§(§_-E2R§,param1[§_-B1C§]);
         _loc2_.§_-J9§(§_-x2l§,[param1[§_-33G§]]);
         _loc2_.§_-J9§(§_-a1z§,[param1[§_-S1F§],param1[§_-61f§]]);
         _loc2_.§_-J9§(§_-qV§,[param1[§_-x28§],param1[§_-j2b§],param1[§_-61M§],param1[§_-g2k§],param1[§_-j13§]]);
         return _loc2_;
      }
      
      public static function §_-Eq§(param1:int) : §_-K1K§
      {
         if(!§_-W2V§)
         {
            §_-W2V§ = [null,§_-HM§,null,§_-tE§,§_-o2G§,§_-92M§,null,§_-YQ§,§_-MC§,§_-r1g§,§_-q1O§,null,null,§_-4G§,§_-K1A§,null,§_-zz§,null];
         }
         if(param1 == §_-qV§)
         {
            return new §_-R2L§(§_-qV§);
         }
         var _loc2_:Class = §_-W2V§[param1];
         return _loc2_ ? new _loc2_() as §_-K1K§ : null;
      }
      
      public function get entityId() : int
      {
         return this.id;
      }
      
      public function get entityName() : String
      {
         return this._name;
      }
      
      public function set entityName(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get photoURL() : String
      {
         return this.§_-91D§;
      }
      
      public function set photoURL(param1:String) : void
      {
         this.§_-91D§ = param1;
      }
      
      public function get isClan() : Boolean
      {
         return true;
      }
      
      public function get formNames() : Array
      {
         return §_-X2R§;
      }
      
      public function §_-D1H§() : Array
      {
         return [§_-P26§,§_-B3d§];
      }
      
      public function §_-B1i§(param1:int) : *
      {
         return §_-Eq§(param1);
      }
      
      public function §_-Is§(param1:int) : *
      {
         return param1 in this.§_-F2T§ ? this.§_-F2T§[param1] : null;
      }
      
      public function §_-J9§(param1:int, param2:*) : void
      {
         this.§_-F2T§[param1] = param2;
      }
      
      public function §_-BJ§() : §_-z1i§
      {
         var _loc1_:§_-z1i§ = new §_-z1i§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-d2z§(this._name);
         _loc1_.§_-d2z§(this.§_-91D§);
         _loc1_.§_-d2z§(this.§_-iV§);
         return _loc1_;
      }
   }
}

