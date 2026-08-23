package §_-E1v§
{
   import §_-Al§.§_-K1K§;
   import flash.utils.Endian;
   import protocol.§_-s2l§;
   import protocol.§_-z1i§;
   
   public dynamic class §_-823§ implements §_-J2w§
   {
      
      public static const §_-K1U§:int = 0;
      
      private static var position:int = 0;
      
      public static const §_-g21§:int = ++position;
      
      public static const §_-D2p§:int = ++position;
      
      public static const §_-dy§:int = ++position;
      
      public static const §_-i13§:int = ++position;
      
      public static const §_-h2h§:int = ++position;
      
      public static const §_-J1v§:int = ++position;
      
      public static const §_-73E§:int = ++position;
      
      public static const §_-a2e§:int = ++position;
      
      public static const §_-61f§:int = ++position;
      
      public static const §_-gM§:int = ++position;
      
      public static const §_-R3§:int = ++position;
      
      public static const §_-82t§:int = ++position;
      
      public static const §_-Dq§:int = ++position;
      
      public static const §_-41c§:int = ++position;
      
      public static const §_-Ye§:int = ++position;
      
      public static const §_-Y2y§:int = ++position;
      
      public static const §_-m23§:int = ++position;
      
      public static const §_-D21§:int = ++position;
      
      public static const §_-t2W§:int = ++position;
      
      public static const §_-IH§:int = ++position;
      
      public static const §_-F2h§:int = ++position;
      
      public static const §_-Hx§:int = ++position;
      
      public static const §_-U22§:int = ++position;
      
      public static const §_-72E§:int = ++position;
      
      public static const §_-WH§:int = ++position;
      
      public static const §_-Jq§:int = ++position;
      
      public static const §_-13L§:int = ++position;
      
      public static const §_-5u§:int = ++position;
      
      public static const §_-z15§:int = ++position;
      
      public static const §_-Dv§:int = ++position;
      
      public static const §_-3z§:int = ++position;
      
      public static const §_-H2n§:int = ++position;
      
      public static const §_-73J§:int = ++position;
      
      public static const §_-O2b§:int = ++position;
      
      public static const §_-p19§:int = ++position;
      
      public static const §_-k2O§:int = ++position;
      
      public static const §_-J1C§:int = ++position;
      
      public static const §_-se§:int = ++position;
      
      public static const §_-1E§:int = ++position;
      
      public static const §_-B2Q§:int = ++position;
      
      public static const §_-k28§:int = ++position;
      
      public static const §_-k16§:int = ++position;
      
      public static const §_-R§:int = ++position;
      
      public static const §_-e27§:int = ++position;
      
      public static const §_-e2P§:int = ++position;
      
      public static const §_-x28§:int = ++position;
      
      public static const §_-j2b§:int = ++position;
      
      public static const §_-61M§:int = ++position;
      
      public static const §_-g2k§:int = ++position;
      
      public static const §_-j13§:int = ++position;
      
      public static const §_-D2q§:int = ++position;
      
      private var §_-F2T§:Object = {};
      
      public var uid:int = 0;
      
      public var nid:String = "";
      
      public var playerName:String = "";
      
      private var §_-91D§:String = "";
      
      public var §_-x2r§:String = "";
      
      public function §_-823§()
      {
         super();
      }
      
      public static function §_-h2Z§(param1:§_-s2l§) : §_-823§
      {
         var _loc2_:§_-823§ = new §_-823§();
         _loc2_.uid = param1[§_-dy§];
         _loc2_.nid = param1[§_-D2p§];
         _loc2_.playerName = param1[§_-i13§];
         _loc2_.§_-91D§ = param1[§_-h2h§];
         _loc2_.§_-x2r§ = param1[§_-J1v§];
         _loc2_.§_-J9§(§_-K1K§.§_-C1Z§,[param1[§_-i13§],param1[§_-h2h§],param1[§_-J1v§]]);
         _loc2_.§_-J9§(§_-K1K§.§_-M1U§,[param1[§_-73E§],param1[§_-a2e§]]);
         _loc2_.§_-J9§(§_-K1K§.§_-l2X§,[param1[§_-61f§]]);
         _loc2_.§_-J9§(§_-K1K§.§_-W27§,[param1[§_-gM§]]);
         _loc2_.§_-J9§(§_-K1K§.§_-fz§,[param1[§_-R3§]]);
         _loc2_.§_-J9§(§_-K1K§.§_-V2n§,[param1[§_-82t§]]);
         _loc2_.§_-J9§(§_-K1K§.§_-rC§,[param1[§_-Dq§]]);
         _loc2_.§_-J9§(§_-K1K§.§_-wb§,[param1[§_-41c§],param1[§_-Ye§],param1[§_-Y2y§],param1[§_-m23§]]);
         _loc2_.§_-J9§(§_-K1K§.§_-12D§,param1[§_-D21§]);
         _loc2_.§_-J9§(§_-K1K§.§_-QJ§,param1[§_-t2W§]);
         _loc2_.§_-J9§(§_-K1K§.§_-x1i§,[param1[§_-IH§],param1[§_-F2h§],param1[§_-Hx§],param1[§_-U22§]]);
         _loc2_.§_-J9§(§_-K1K§.§_-y2q§,param1[§_-72E§]);
         _loc2_.§_-J9§(§_-K1K§.§_-jN§,param1[§_-WH§]);
         _loc2_.§_-J9§(§_-K1K§.§_-l1s§,param1[§_-Jq§]);
         _loc2_.§_-J9§(§_-K1K§.§_-pY§,param1[§_-13L§]);
         _loc2_.§_-J9§(§_-K1K§.§_-F§,param1[§_-5u§]);
         _loc2_.§_-J9§(§_-K1K§.EXCHANGE,param1[§_-z15§]);
         _loc2_.§_-J9§(§_-K1K§.§_-9h§,param1[§_-Dv§]);
         _loc2_.§_-J9§(§_-K1K§.§_-x2p§,param1[§_-3z§]);
         _loc2_.§_-J9§(§_-K1K§.§_-t1d§,[param1[§_-H2n§]]);
         _loc2_.§_-J9§(§_-K1K§.§_-62E§,param1[§_-73J§]);
         _loc2_.§_-J9§(§_-K1K§.§_-sa§,param1[§_-O2b§]);
         _loc2_.§_-J9§(§_-K1K§.§_-Z2N§,[param1[§_-p19§],param1[§_-k2O§],param1[§_-J1C§],param1[§_-se§],param1[§_-1E§],param1[§_-B2Q§]]);
         _loc2_.§_-J9§(§_-K1K§.§_-Ug§,param1[§_-k28§]);
         _loc2_.§_-J9§(§_-K1K§.§_-eS§,param1[§_-k16§]);
         _loc2_.§_-J9§(§_-K1K§.§_-L1b§,[param1[§_-R§]]);
         _loc2_.§_-J9§(§_-K1K§.§_-23J§,param1[§_-e27§]);
         _loc2_.§_-J9§(§_-K1K§.§_-b1B§,param1[§_-e2P§]);
         _loc2_.§_-J9§(§_-K1K§.§_-qV§,[param1[§_-x28§],param1[§_-j2b§],param1[§_-61M§],param1[§_-g2k§],param1[§_-j13§]]);
         _loc2_.§_-J9§(§_-K1K§.§_-61L§,param1[§_-D2q§]);
         return _loc2_;
      }
      
      public function get entityId() : int
      {
         return this.uid;
      }
      
      public function get entityName() : String
      {
         return this.playerName;
      }
      
      public function set entityName(param1:String) : void
      {
         this.playerName = param1;
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
         return false;
      }
      
      public function get formNames() : Array
      {
         return §_-K1K§.§_-X2R§;
      }
      
      public function §_-D1H§() : Array
      {
         return [§_-K1K§.§_-C1Z§];
      }
      
      public function §_-B1i§(param1:int) : *
      {
         return §_-K1K§.§_-Eq§(param1);
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
         _loc1_.§_-d2z§(this.playerName);
         _loc1_.§_-d2z§(this.§_-91D§);
         return _loc1_;
      }
   }
}

