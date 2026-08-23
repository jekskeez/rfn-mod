package §_-l26§
{
   import §_-p1f§.§_-6Y§;
   import §_-p1f§.§_-9b§;
   import §_-p1f§.§_-A2d§;
   import §_-p1f§.§_-Di§;
   import §_-p1f§.§_-K2s§;
   import §_-p1f§.§_-RZ§;
   import §_-p1f§.§_-T2s§;
   import §_-p1f§.§_-a1Q§;
   import §_-p1f§.§_-cB§;
   import §_-p1f§.§_-f1F§;
   import §_-p1f§.§_-k4§;
   import §_-p1f§.§_-kp§;
   import §_-p1f§.§_-o1H§;
   import flash.utils.Endian;
   import protocol.§_-S2I§;
   import protocol.§_-U1M§;
   
   public dynamic class §_-z2g§ implements §_-s18§
   {
      
      public static const §_-e§:int = 0;
      
      public static const §_-g2n§:int = 0;
      
      public static const §_-K12§:int = 1;
      
      public static const §_-e2p§:int = 2;
      
      public static const SIZE:int = 3;
      
      public static const STATE:int = 4;
      
      public static const §_-819§:int = 5;
      
      public static const §_-X13§:int = 6;
      
      public static const §_-X2U§:int = 7;
      
      public static const §_-N29§:int = 8;
      
      public static const §_-TZ§:int = 9;
      
      public static const §_-6V§:int = 10;
      
      public static const §_-Q1V§:int = 11;
      
      public static const §_-q2Y§:int = 12;
      
      public static const §_-02f§:int = 13;
      
      public static const §_-23c§:int = 14;
      
      public static const §_-M2k§:int = 15;
      
      public static const §_-I25§:int = 16;
      
      public static const §_-aS§:int = 17;
      
      private static var position:int = 0;
      
      public static const §_-H2R§:int = ++position;
      
      public static const §_-12x§:int = ++position;
      
      public static const §_-O1x§:int = ++position;
      
      public static const §_-Wm§:int = ++position;
      
      public static const §_-13u§:int = ++position;
      
      public static const §_-s1G§:int = ++position;
      
      public static const §_-o1K§:int = ++position;
      
      public static const §_-Mj§:int = ++position;
      
      public static const §_-o1S§:int = ++position;
      
      public static const §_-Qx§:int = ++position;
      
      public static const §_-E2l§:int = ++position;
      
      public static const §_-R16§:int = ++position;
      
      public static const §_-Yl§:int = ++position;
      
      public static const §_-lz§:int = ++position;
      
      public static const §_-Ki§:int = ++position;
      
      public static const §_-q21§:int = ++position;
      
      public static const §_-G2Q§:int = ++position;
      
      public static const §_-dZ§:int = ++position;
      
      public static const §_-31b§:int = ++position;
      
      public static const §_-Ne§:int = ++position;
      
      public static const §_-X2m§:int = ++position;
      
      public static const §_-c2S§:int = ++position;
      
      public static const §_-DT§:int = ++position;
      
      public static const §_-u1X§:int = ++position;
      
      public static const §_-V2c§:int = ++position;
      
      public static const §_-K2U§:int = ++position;
      
      public static const §_-Wj§:int = ++position;
      
      public static const §_-c2N§:int = ++position;
      
      public static const §_-R1v§:int = ++position;
      
      public static const §_-ZC§:Array = ["Инфо","Новости","Лидер","Размер","Статус","Ранг","Изменение ранга","Места","Бан","Тотемы","Ранги тотемов","Бонусы тотемов","Статистика","Чёрный лист","Опоры","Уровень входа","Баланс","Рейтинг"];
      
      private static var §_-b10§:Array = null;
      
      private var §_-B2q§:Object = {};
      
      public var id:int = 0;
      
      private var _name:String = "";
      
      private var §_-H1n§:String = "";
      
      public var §_-c2c§:String = "";
      
      public function §_-z2g§()
      {
         super();
      }
      
      public static function §_-82d§(param1:§_-S2I§) : §_-z2g§
      {
         var _loc2_:§_-z2g§ = new §_-z2g§();
         _loc2_.id = param1[§_-H2R§];
         _loc2_._name = param1[§_-12x§];
         _loc2_.§_-H1n§ = param1[§_-O1x§];
         _loc2_.§_-c2c§ = param1[§_-Wm§];
         _loc2_.§_-Ob§(§_-g2n§,[param1[§_-12x§],param1[§_-O1x§],param1[§_-Wm§]]);
         _loc2_.§_-Ob§(§_-K12§,[param1[§_-13u§]]);
         _loc2_.§_-Ob§(§_-e2p§,[param1[§_-s1G§]]);
         _loc2_.§_-Ob§(SIZE,[param1[§_-o1K§],param1[§_-Yl§]]);
         _loc2_.§_-Ob§(STATE,[param1[§_-Mj§]]);
         _loc2_.§_-Ob§(§_-819§,[param1[§_-o1S§],param1[§_-Qx§],param1[§_-E2l§]]);
         _loc2_.§_-Ob§(§_-X13§,[param1[§_-R16§]]);
         _loc2_.§_-Ob§(§_-X2U§,[param1[§_-Yl§]]);
         _loc2_.§_-Ob§(§_-N29§,[param1[§_-lz§]]);
         _loc2_.§_-Ob§(§_-TZ§,{
            "slots":param1[§_-Ki§],
            "booster":param1[§_-q21§]
         });
         _loc2_.§_-Ob§(§_-6V§,param1[§_-G2Q§]);
         _loc2_.§_-Ob§(§_-Q1V§,param1[§_-dZ§]);
         _loc2_.§_-Ob§(§_-q2Y§,param1[§_-31b§]);
         _loc2_.§_-Ob§(§_-02f§,param1[§_-Ne§]);
         _loc2_.§_-Ob§(§_-23c§,param1[§_-X2m§]);
         _loc2_.§_-Ob§(§_-M2k§,[param1[§_-c2S§]]);
         _loc2_.§_-Ob§(§_-I25§,[param1[§_-DT§],param1[§_-u1X§]]);
         _loc2_.§_-Ob§(§_-aS§,[param1[§_-V2c§],param1[§_-K2U§],param1[§_-Wj§],param1[§_-c2N§],param1[§_-R1v§]]);
         return _loc2_;
      }
      
      public static function §_-Q2Y§(param1:int) : §_-6Y§
      {
         if(!§_-b10§)
         {
            §_-b10§ = [null,§_-a1Q§,null,§_-k4§,§_-cB§,§_-A2d§,null,§_-K2s§,§_-o1H§,§_-kp§,§_-Di§,null,null,§_-9b§,§_-T2s§,null,§_-f1F§,null];
         }
         if(param1 == §_-aS§)
         {
            return new §_-RZ§(§_-aS§);
         }
         var _loc2_:Class = §_-b10§[param1];
         return _loc2_ ? new _loc2_() as §_-6Y§ : null;
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
         return this.§_-H1n§;
      }
      
      public function set photoURL(param1:String) : void
      {
         this.§_-H1n§ = param1;
      }
      
      public function get isClan() : Boolean
      {
         return true;
      }
      
      public function get formNames() : Array
      {
         return §_-ZC§;
      }
      
      public function §_-yN§() : Array
      {
         return [§_-g2n§,§_-e2p§];
      }
      
      public function §_-IO§(param1:int) : *
      {
         return §_-Q2Y§(param1);
      }
      
      public function §_-mi§(param1:int) : *
      {
         return param1 in this.§_-B2q§ ? this.§_-B2q§[param1] : null;
      }
      
      public function §_-Ob§(param1:int, param2:*) : void
      {
         this.§_-B2q§[param1] = param2;
      }
      
      public function §_-Ux§() : §_-U1M§
      {
         var _loc1_:§_-U1M§ = new §_-U1M§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-4E§(this._name);
         _loc1_.§_-4E§(this.§_-H1n§);
         _loc1_.§_-4E§(this.§_-c2c§);
         return _loc1_;
      }
   }
}

