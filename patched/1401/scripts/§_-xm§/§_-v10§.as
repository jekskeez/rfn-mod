package §_-xm§
{
   import §_-Kr§.ScrollPane;
   import §_-dc§.Clan;
   import §_-dc§.§_-e2W§;
   import §_-k1c§.Dialog;
   import com.api.Player;
   import com.api.PlayerEvent;
   import events.§_-n13§;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import views.§_-y2w§;
   
   public class §_-v10§ extends Dialog
   {
      
      private var §_-a1R§:int;
      
      private var §_-81t§:Clan;
      
      private var players:Object = {};
      
      private var §_-i2d§:Object = {};
      
      private var list:Sprite = new Sprite();
      
      private var §_-M1N§:ScrollPane;
      
      private var §_-n1§:§_-22V§;
      
      private var §_-M2C§:§_-22V§;
      
      private var §_-3x§:§_-22V§;
      
      public function §_-v10§(param1:int)
      {
         super(gls("Статистика за прошедшие сутки"));
         this.clanId = param1;
         §_-e2W§.listen(this.onClanLoaded);
         this.init();
      }
      
      override public function show() : void
      {
         §_-e2W§.request(this.clanId,§_-Oy§.§_-W1X§,true);
         super.show();
      }
      
      override protected function get captionFormat() : TextFormat
      {
         return new TextFormat(§_-22V§.§_-pJ§,15,16763904,null,null,null,null,null,"center");
      }
      
      public function get clanId() : int
      {
         return this.§_-a1R§;
      }
      
      public function set clanId(param1:int) : void
      {
         if(param1 == this.§_-a1R§)
         {
            return;
         }
         this.§_-a1R§ = param1;
         this.players = {};
         this.§_-i2d§ = {};
         while(this.list.numChildren > 0)
         {
            this.list.removeChildAt(0);
         }
      }
      
      private function init() : void
      {
         addChild(new §_-22V§(gls("Игрок"),15,0,new TextFormat(null,12,0,true)));
         addChild(new §_-22V§(gls("Опыт\nигрока"),140,0,new TextFormat(null,12,0,true,null,null,null,null,TextFormatAlign.CENTER)));
         addChild(new §_-22V§(gls("Опыт\nклана"),230,0,new TextFormat(null,12,0,true,null,null,null,null,TextFormatAlign.CENTER)));
         addChild(new §_-22V§(gls("Очки\nрейтинга"),320,0,new TextFormat(null,12,0,true,null,null,null,null,TextFormatAlign.CENTER)));
         addChild(new §_-22V§(gls("Всего"),15,305,new TextFormat(null,14,0,true)));
         this.§_-M2C§ = addChild(new §_-22V§("",160,305,new TextFormat(null,14,0,true))) as §_-22V§;
         this.§_-n1§ = addChild(new §_-22V§("",250,305,new TextFormat(null,14,0,true))) as §_-22V§;
         this.§_-3x§ = addChild(new §_-22V§("",340,305,new TextFormat(null,14,0,true))) as §_-22V§;
         this.§_-M1N§ = new ScrollPane();
         this.§_-M1N§.x = 0;
         this.§_-M1N§.y = 30;
         this.§_-M1N§.setSize(390,280);
         this.§_-M1N§.source = this.list;
         addChild(this.§_-M1N§);
         place();
         this.width = 450;
         this.height = 380;
      }
      
      private function onClanLoaded(param1:§_-n13§) : void
      {
         var _loc2_:Clan = param1.§_-81t§;
         if(_loc2_.id != this.clanId)
         {
            return;
         }
         this.§_-81t§ = _loc2_;
         this.update();
      }
      
      private function update() : void
      {
         if(this.§_-81t§ == null || this.§_-81t§.§_-Ox§ == null)
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
         while(_loc7_ < this.§_-81t§.§_-Ox§.length)
         {
            if(!(this.§_-81t§.§_-Ox§[_loc7_] in this.players))
            {
               _loc1_.push(this.§_-81t§.§_-Ox§[_loc7_]);
            }
            _loc2_[this.§_-81t§.§_-Ox§[_loc7_]] = {
               "exp":this.§_-81t§.§_-Ox§[_loc7_ + 1],
               "rating":this.§_-81t§.§_-Ox§[_loc7_ + 2],
               "samples":this.§_-81t§.§_-Ox§[_loc7_ + 3]
            };
            _loc3_[this.§_-81t§.§_-Ox§[_loc7_]] = this.§_-i2d§[this.§_-81t§.§_-Ox§[_loc7_]];
            _loc4_ += this.§_-81t§.§_-Ox§[_loc7_ + 1];
            _loc6_ += this.§_-81t§.§_-Ox§[_loc7_ + 2];
            _loc5_ += this.§_-81t§.§_-Ox§[_loc7_ + 3];
            _loc7_ += 4;
         }
         Game.listen(this.§_-P9§);
         Game.request(_loc1_,§_-hF§.§_-31q§,true);
         this.players = _loc2_;
         this.§_-i2d§ = _loc3_;
         this.sort();
         this.§_-M2C§.text = _loc5_.toString();
         this.§_-M2C§.x = 160 - int(this.§_-M2C§.textWidth * 0.5);
         this.§_-n1§.text = _loc4_.toString();
         this.§_-n1§.x = 250 - int(this.§_-n1§.textWidth * 0.5);
         this.§_-3x§.text = _loc6_.toString();
         this.§_-3x§.x = 350 - int(this.§_-3x§.textWidth * 0.5);
      }
      
      private function §_-P9§(param1:PlayerEvent) : void
      {
         var _loc2_:Player = param1.player;
         if(!(_loc2_.id in this.players))
         {
            return;
         }
         if(!_loc2_.isLoaded(§_-hF§.§_-31q§))
         {
            return;
         }
         if(!(_loc2_.id in this.§_-i2d§) || !this.§_-i2d§[_loc2_.id])
         {
            this.§_-i2d§[_loc2_.id] = new §_-y2w§(_loc2_.id);
         }
         (this.§_-i2d§[_loc2_.id] as §_-y2w§).playerName = _loc2_.name;
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
         for(_loc2_ in this.§_-i2d§)
         {
            if(this.§_-i2d§[_loc2_])
            {
               (this.§_-i2d§[_loc2_] as §_-y2w§).setData(this.players[_loc2_]);
               _loc1_.push(this.§_-i2d§[_loc2_]);
            }
         }
         _loc1_.sort(this.§_-F14§);
         _loc3_ = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc1_[_loc3_].y = 20 * _loc3_;
            (_loc1_[_loc3_] as §_-y2w§).number = _loc3_ + 1;
            this.list.addChild(_loc1_[_loc3_]);
            _loc3_++;
         }
         this.§_-M1N§.source = this.list;
         this.§_-M1N§.update();
      }
      
      private function §_-F14§(param1:§_-y2w§, param2:§_-y2w§) : int
      {
         return int(param1.§_-Lx§) < int(param2.§_-Lx§) ? 1 : -1;
      }
   }
}

