package §_-xm§
{
   import §_-O1t§.§_-L2q§;
   import §_-dc§.Clan;
   import §_-dc§.§_-Rm§;
   import §_-dc§.§_-X1g§;
   import §_-dc§.§_-e2W§;
   import §_-k1c§.Dialog;
   import §_-k1c§.§_-Q13§;
   import buttons.§_-j18§;
   import events.§_-T25§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import protocol.§_-h2B§;
   import utils.§_-jB§;
   import views.§_-b1§;
   
   public class §_-I2I§ extends Dialog
   {
      
      public static const §_-23l§:int = 5;
      
      public static const §_-D13§:int = 5;
      
      public static const §_-v2n§:int = 100;
      
      private static var §_-BS§:int = 0;
      
      private var §_-Zm§:§_-L2q§ = null;
      
      private var §_-837§:§_-Q13§;
      
      private var §_-pk§:§_-j18§ = null;
      
      private var §_-WY§:Vector.<DisplayObject> = new Vector.<DisplayObject>();
      
      public function §_-I2I§()
      {
         super(gls("Заявки на вступление в клан"));
         this.init();
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-PZ§]);
      }
      
      override public function clear() : void
      {
         super.clear();
         this.§_-Zm§.clear();
      }
      
      public function §_-k1§(param1:Array) : void
      {
         var _loc2_:Vector.<§_-Rm§> = new Vector.<§_-Rm§>();
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_.push(new §_-Rm§(param1[_loc3_],param1[_loc3_ + 1]));
            _loc3_ += 2;
         }
         this.§_-Zm§.§_-k1§(_loc2_);
      }
      
      private function init() : void
      {
         var _loc3_:Sprite = null;
         var _loc4_:TextFormat = null;
         var _loc5_:§_-22V§ = null;
         var _loc6_:§_-b1§ = null;
         this.§_-837§ = new §_-Q13§(gls("Клан заблокирован"),gls("Ты не можешь принимать или отклонять заявки,\nт.к. твой клан заблокирован."));
         this.§_-Zm§ = new §_-L2q§();
         this.§_-Zm§.x = 15;
         this.§_-Zm§.y = 24;
         this.§_-Zm§.addEventListener(§_-T25§.§_-31q§,this.§_-S29§);
         addChild(this.§_-Zm§);
         var _loc1_:§_-j18§ = new §_-j18§(gls("Принять"));
         _loc1_.x = 80;
         _loc1_.y = this.§_-Zm§.y + this.§_-Zm§.height - 40;
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-R2X§);
         addChild(_loc1_);
         var _loc2_:§_-j18§ = new §_-j18§(gls("Отказать"));
         _loc2_.x = 185;
         _loc2_.y = this.§_-Zm§.y + this.§_-Zm§.height - 40;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-U17§);
         addChild(_loc2_);
         if(Game.self["clan_duty"] == Clan.§_-k1P§)
         {
            _loc3_ = new Sprite();
            _loc3_.graphics.beginFill(15524553);
            _loc3_.graphics.drawRoundRectComplex(0,0,325,125,7.5,7.5,7.5,7.5);
            _loc3_.graphics.endFill();
            _loc3_.x = 10;
            _loc3_.y = _loc2_.y + _loc2_.height + 10;
            addChild(_loc3_);
            _loc4_ = new TextFormat(null,14,4666410,false);
            _loc4_.align = TextFormatAlign.CENTER;
            _loc4_.leading = 2.5;
            _loc5_ = new §_-22V§("",_loc3_.x + 20,_loc3_.y + 10,_loc4_);
            _loc5_.text = gls("Получая новый уровень клана, ты можешь\nдобавлять  больше участников,\nтакже ты можешь купить места за монетки");
            addChild(_loc5_);
            this.§_-pk§ = new §_-j18§(gls("Купить {0} мест за {1}",§_-D13§,5) + " -   ",200);
            this.§_-pk§.x = 75;
            this.§_-pk§.y = _loc5_.y + 65;
            this.§_-pk§.addEventListener(MouseEvent.CLICK,this.§_-wl§);
            addChild(this.§_-pk§);
            _loc6_ = new §_-b1§();
            _loc6_.x = _loc3_.x;
            _loc6_.y = _loc3_.y + _loc3_.height + 10;
            _loc6_.§_-KM§ = §_-e2W§.§_-W2X§(Game.self["clan_id"]).§_-xy§;
            addChild(_loc6_);
         }
         place();
         this.height += 60;
         this.width += 26;
      }
      
      public function §_-e20§(param1:int) : void
      {
         var _loc2_:DisplayObject = null;
         if(Game.self["clan_duty"] != Clan.§_-k1P§)
         {
            return;
         }
         §_-BS§ = Math.min(§_-v2n§,§_-23l§ * (param1 / §_-D13§ + 1));
         this.§_-pk§.field.text = gls("Купить {0} мест за {1}",§_-D13§,§_-BS§) + " -   ";
         this.§_-pk§.redraw();
         while(this.§_-WY§.length > 0)
         {
            _loc2_ = this.§_-WY§.shift();
            _loc2_.parent.removeChild(_loc2_);
         }
         this.§_-WY§ = §_-jB§.§_-fG§(this.§_-pk§.field,"-",ImageIconCoins,0.7,0.7,-this.§_-pk§.field.x,-3,false,false);
      }
      
      private function §_-wl§(param1:MouseEvent) : void
      {
         if(§_-e2W§.§_-W2X§(Game.self["clan_id"]).state == §_-S2I§.§_-F2Q§)
         {
            this.§_-837§.show();
            return;
         }
         if(§_-e2W§.§_-W2X§(Game.self["clan_id"]).coins < §_-BS§ && (Game.self["clan_duty"] == Clan.§_-k1P§ || Game.self["clan_duty"] == Clan.§_-jY§))
         {
            new §_-53k§(gls("Недостаточно монет"),gls("У вашего клана недостаточно денег      \nдля покупки дополнительных мест.\nПополните бюджет вашего клана.")).show();
            return;
         }
         if(Game.self["clan_duty"] == Clan.§_-k1P§ || Game.self["clan_duty"] == Clan.§_-jY§)
         {
            Connection.§_-Li§(§_-h2B§.BUY,§_-h2B§.§_-j2s§,§_-BS§,0);
         }
         else
         {
            Game.buy(§_-h2B§.§_-j2s§,§_-BS§,0);
         }
      }
      
      private function §_-R2X§(param1:MouseEvent) : void
      {
         if(§_-e2W§.§_-W2X§(Game.self["clan_id"]).state == §_-S2I§.§_-F2Q§)
         {
            this.§_-837§.show();
            return;
         }
         this.§_-Zm§.§_-v1a§();
      }
      
      private function §_-U17§(param1:MouseEvent) : void
      {
         if(§_-e2W§.§_-W2X§(Game.self["clan_id"]).state == §_-S2I§.§_-F2Q§)
         {
            this.§_-837§.show();
            return;
         }
         this.§_-Zm§.§_-M1S§();
      }
      
      private function §_-S29§(param1:§_-T25§) : void
      {
         dispatchEvent(new §_-T25§(param1.count));
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         if(!§_-X1g§.§_-G2p§)
         {
            return;
         }
         this.§_-k1§(param1[0]);
      }
   }
}

