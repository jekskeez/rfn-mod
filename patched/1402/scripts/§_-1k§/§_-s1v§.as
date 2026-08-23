package §_-1k§
{
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import events.§_-a1V§;
   import protocol.§_-s2l§;
   import views.§_-236§;
   import views.§_-SZ§;
   
   public class §_-s1v§ extends §_-G2R§ implements §_-122§
   {
      
      private var §_-g1F§:§_-i5§ = null;
      
      private var emblem:§_-SZ§ = null;
      
      private var photo:§_-236§ = null;
      
      private var §_-Jx§:int = -1;
      
      public function §_-s1v§(param1:int, param2:int, param3:int, param4:int)
      {
         super(param1,param2,param4);
         this.clanId = param3;
      }
      
      public function get clanId() : int
      {
         return this.§_-Jx§;
      }
      
      public function set clanId(param1:int) : void
      {
         this.§_-Jx§ = param1;
      }
      
      override public function §_-O1s§() : void
      {
         if(this.photo != null)
         {
            return;
         }
         super.§_-O1s§();
         this.photo = new §_-236§("",0,0,80);
         addChild(this.photo);
         var _loc1_:§_-i5§ = new §_-i5§("",0,0,style);
         _loc1_.x = 85;
         _loc1_.y = 10;
         addChild(_loc1_);
         this.emblem = new §_-SZ§("",90,33);
         addChild(this.emblem);
         this.§_-g1F§ = new §_-i5§("",100,29,style);
         addChild(this.§_-g1F§);
         switch(this.type)
         {
            case §_-s2l§.§_-k1N§:
            case §_-s2l§.§_-63p§:
               _loc1_.htmlText = "<body>" + gls("Твоя заявка на вступление в клан") + "<body>";
               break;
            case §_-s2l§.§_-Xy§:
            case §_-s2l§.§_-r2w§:
               _loc1_.htmlText = "<body>" + gls("Клан") + "<body>";
               this.emblem.x = 122;
               this.emblem.y = 14;
               this.§_-g1F§.x = 85;
               this.§_-g1F§.y = 10;
               break;
            case §_-s2l§.§_-Y2P§:
               _loc1_.htmlText = "<body>" + gls("В клане") + "<body>";
               this.emblem.visible = false;
               this.§_-g1F§.x = 85;
               this.§_-g1F§.y = 10;
         }
         §_-B2U§.listen(this.§_-g1w§);
         §_-B2U§.request(this.clanId,§_-eT§.ALL);
      }
      
      private function §_-g1w§(param1:§_-a1V§) : void
      {
         var _loc3_:String = null;
         var _loc2_:Clan = param1.§_-b19§;
         if(_loc2_.id != this.clanId)
         {
            return;
         }
         §_-B2U§.forget(this.§_-g1w§);
         this.photo.load(_loc2_.§_-51L§);
         this.emblem.load(_loc2_.§_-o1p§);
         switch(this.type)
         {
            case §_-s2l§.§_-Xy§:
               this.§_-g1F§.htmlText = gls("<body><textformat leading=\'4\'>              {0}<br/>заблокирован за неуплату.</textformat><body>",_loc2_.name);
               break;
            case §_-s2l§.§_-r2w§:
               this.§_-g1F§.htmlText = gls("<body><textformat leading=\'4\'>              {0}<br/>удален.</textformat><body>",_loc2_.name);
               break;
            case §_-s2l§.§_-63p§:
               this.§_-g1F§.htmlText = gls("<body>{0} отклонена.<body>",_loc2_.name);
               break;
            case §_-s2l§.§_-k1N§:
               this.§_-g1F§.htmlText = gls("<body>{0} одобрена.<body>",_loc2_.name);
               break;
            case §_-s2l§.§_-Y2P§:
               this.§_-g1F§.width = 350;
               this.§_-g1F§.multiline = true;
               this.§_-g1F§.wordWrap = true;
               this.§_-g1F§.mouseEnabled = false;
               _loc3_ = §_-B2U§.§_-Z2Y§ == null ? "" : §_-B2U§.§_-Z2Y§.slice().replace(/\r/g," ");
               if(_loc3_.length > 100)
               {
                  _loc3_ = _loc3_.substr(0,100).concat("...");
               }
               this.§_-g1F§.htmlText = gls("<body>               изменилась новость дня:<span class=\'blackSmall\'><br/>{0}</span><body>",_loc3_);
         }
      }
   }
}

