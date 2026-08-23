package §_-I18§
{
   import §_-B1G§.ScrollPane;
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import §_-bN§.Dialog;
   import com.api.Player;
   import com.api.PlayerEvent;
   import events.§_-a1V§;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import views.§_-b1L§;
   
   public class §_-A3w§ extends Dialog
   {
      
      private var §_-Jx§:int;
      
      private var §_-b19§:Clan;
      
      private var players:Object = {};
      
      private var §_-71r§:Object = {};
      
      private var list:Sprite = new Sprite();
      
      private var §_-W18§:ScrollPane;
      
      private var §_-9y§:§_-i5§;
      
      private var §_-Q1s§:§_-i5§;
      
      private var §_-n1c§:§_-i5§;
      
      public function §_-A3w§(param1:int)
      {
         super(gls("Статистика за прошедшие сутки"));
         this.clanId = param1;
         §_-B2U§.listen(this.onClanLoaded);
         this.init();
      }
      
      override public function show() : void
      {
         §_-B2U§.request(this.clanId,§_-eT§.§_-a2c§,true);
         super.show();
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return new TextFormat(§_-i5§.§_-p1s§,15,16763904,null,null,null,null,null,"center");
      }
      
      public function get clanId() : int
      {
         return this.§_-Jx§;
      }
      
      public function set clanId(param1:int) : void
      {
         if(param1 == this.§_-Jx§)
         {
            return;
         }
         this.§_-Jx§ = param1;
         this.players = {};
         this.§_-71r§ = {};
         while(this.list.numChildren > 0)
         {
            this.list.removeChildAt(0);
         }
      }
      
      private function init() : void
      {
         addChild(new §_-i5§(gls("Игрок"),15,0,new TextFormat(null,12,0,true)));
         addChild(new §_-i5§(gls("Опыт\nигрока"),140,0,new TextFormat(null,12,0,true,null,null,null,null,TextFormatAlign.CENTER)));
         addChild(new §_-i5§(gls("Опыт\nклана"),230,0,new TextFormat(null,12,0,true,null,null,null,null,TextFormatAlign.CENTER)));
         addChild(new §_-i5§(gls("Очки\nрейтинга"),320,0,new TextFormat(null,12,0,true,null,null,null,null,TextFormatAlign.CENTER)));
         addChild(new §_-i5§(gls("Всего"),15,305,new TextFormat(null,14,0,true)));
         this.§_-Q1s§ = addChild(new §_-i5§("",160,305,new TextFormat(null,14,0,true))) as §_-i5§;
         this.§_-9y§ = addChild(new §_-i5§("",250,305,new TextFormat(null,14,0,true))) as §_-i5§;
         this.§_-n1c§ = addChild(new §_-i5§("",340,305,new TextFormat(null,14,0,true))) as §_-i5§;
         this.§_-W18§ = new ScrollPane();
         this.§_-W18§.x = 0;
         this.§_-W18§.y = 30;
         this.§_-W18§.setSize(390,280);
         this.§_-W18§.source = this.list;
         addChild(this.§_-W18§);
         place();
         this.width = 450;
         this.height = 380;
      }
      
      private function onClanLoaded(param1:§_-a1V§) : void
      {
         var _loc2_:Clan = param1.§_-b19§;
         if(_loc2_.id != this.clanId)
         {
            return;
         }
         this.§_-b19§ = _loc2_;
         this.update();
      }
      
      private function update() : void
      {
         if(this.§_-b19§ == null || this.§_-b19§.§_-tm§ == null)
         {
            return;
         }
         var _loc1_:Array = [];
         var _loc2_:Object = {};
         var _loc3_:Object = {};
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         while(_loc7_ < this.§_-b19§.§_-tm§.length)
         {
            if(!(this.§_-b19§.§_-tm§[_loc7_] in this.players))
            {
               _loc1_.push(this.§_-b19§.§_-tm§[_loc7_]);
            }
            _loc2_[this.§_-b19§.§_-tm§[_loc7_]] = {
               "exp":this.§_-b19§.§_-tm§[_loc7_ + 1],
               "rating":this.§_-b19§.§_-tm§[_loc7_ + 2],
               "samples":this.§_-b19§.§_-tm§[_loc7_ + 3]
            };
            _loc3_[this.§_-b19§.§_-tm§[_loc7_]] = this.§_-71r§[this.§_-b19§.§_-tm§[_loc7_]];
            _loc4_ += this.§_-b19§.§_-tm§[_loc7_ + 1];
            _loc6_ += this.§_-b19§.§_-tm§[_loc7_ + 2];
            _loc5_ += this.§_-b19§.§_-tm§[_loc7_ + 3];
            _loc7_ += 4;
         }
         Game.listen(this.§_-Y16§);
         Game.request(_loc1_,§_-Y2E§.§_-n2H§,true);
         this.players = _loc2_;
         this.§_-71r§ = _loc3_;
         this.sort();
         this.§_-Q1s§.text = _loc5_.toString();
         this.§_-Q1s§.x = 160 - int(this.§_-Q1s§.textWidth * 0.5);
         this.§_-9y§.text = _loc4_.toString();
         this.§_-9y§.x = 250 - int(this.§_-9y§.textWidth * 0.5);
         this.§_-n1c§.text = _loc6_.toString();
         this.§_-n1c§.x = 350 - int(this.§_-n1c§.textWidth * 0.5);
      }
      
      private function §_-Y16§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(!(_loc2_.id in this.players))
         {
            return;
         }
         if(!_loc2_.isLoaded(§_-Y2E§.§_-n2H§))
         {
            return;
         }
         if(!(_loc2_.id in this.§_-71r§) || !this.§_-71r§[_loc2_.id])
         {
            this.§_-71r§[_loc2_.id] = new §_-b1L§(_loc2_.id);
         }
         (this.§_-71r§[_loc2_.id] as §_-b1L§).playerName = _loc2_.name;
         this.sort();
      }
      
      private function sort() : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         while(this.list.numChildren > 0)
         {
            this.list.removeChildAt(0);
         }
         var _loc1_:Array = [];
         for(_loc2_ in this.§_-71r§)
         {
            if(this.§_-71r§[_loc2_])
            {
               (this.§_-71r§[_loc2_] as §_-b1L§).setData(this.players[_loc2_]);
               _loc1_.push(this.§_-71r§[_loc2_]);
            }
         }
         _loc1_.sort(this.§_-v29§);
         _loc3_ = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc1_[_loc3_].y = 20 * _loc3_;
            (_loc1_[_loc3_] as §_-b1L§).number = _loc3_ + 1;
            this.list.addChild(_loc1_[_loc3_]);
            _loc3_++;
         }
         this.§_-W18§.source = this.list;
         this.§_-W18§.update();
      }
      
      private function §_-v29§(param1:§_-b1L§, param2:§_-b1L§) : int
      {
         return int(param1.§_-23Y§) < int(param2.§_-23Y§) ? 1 : -1;
      }
   }
}

