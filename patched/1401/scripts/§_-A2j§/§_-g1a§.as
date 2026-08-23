package §_-A2j§
{
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-e1G§.§_-Hb§;
   import buttons.§_-F1F§;
   import buttons.§_-G2L§;
   import buttons.§_-T2z§;
   import buttons.§_-j18§;
   import events.GameEvent;
   import events.§_-4Y§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import protocol.§_-h2B§;
   import tape.§_-91w§;
   import tape.§_-A3s§;
   import tape.§_-wP§;
   import tape.§_-xc§;
   import utils.§_-jB§;
   import views.§_-63X§;
   
   public class §_-g1a§ extends §_-wP§
   {
      
      private static const §_-HM§:Array = [new TextFormat(§_-22V§.§_-pJ§,16,8746579),new TextFormat(§_-22V§.§_-pJ§,16,8746579),new TextFormat(§_-22V§.§_-pJ§,16,8746579)];
      
      private static var _instance:§_-g1a§ = null;
      
      private static var _type:int = 0;
      
      private var button:§_-j18§ = null;
      
      private var §_-EE§:§_-G2L§ = null;
      
      private var §_-zl§:§_-22V§ = null;
      
      private var §_-eY§:Array = [];
      
      private var §_-Xk§:§_-63X§ = null;
      
      public function §_-g1a§()
      {
         super(4,3,10,5,15,15,110,115,true,true,false);
         _instance = this;
         §_-h1f§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.§_-a13§);
      }
      
      public static function §_-23H§(param1:int) : void
      {
         if(_instance)
         {
            _instance.§_-EE§.§_-vC§(param1 + 1);
         }
         else
         {
            _type = param1 + 1;
         }
      }
      
      override public function setData(param1:§_-xc§) : void
      {
         super.setData(param1);
         if(param1.objects.length != 0)
         {
            select(param1.objects[0] as §_-A3s§);
         }
         else
         {
            select(null);
         }
      }
      
      override protected function §_-x2k§(param1:§_-A3s§) : void
      {
         this.button.field.text = §_-g2W§.§_-q1s§(this.§_-Y1y§.id) + " - ";
         this.button.clear();
         this.button.redraw();
         §_-jB§.§_-fG§(this.button.field,"-",ImageIconCoins,0.7,0.7,-this.button.field.x,-3,false,false);
         this.button.visible = !§_-h1f§.§_-i21§(this.§_-Y1y§.id,§_-h1f§.§_-03X§);
         this.§_-zl§.text = §_-g2W§.§_-224§(this.§_-Y1y§.id);
         this.§_-zl§.x = 520 + int((340 - this.§_-zl§.textWidth) * 0.5);
         if(this.§_-Xk§)
         {
            removeChild(this.§_-Xk§);
         }
         this.§_-Xk§ = new §_-63X§(this.§_-Y1y§.id);
         this.§_-Xk§.x = 540;
         this.§_-Xk§.y = 100;
         addChild(this.§_-Xk§);
      }
      
      override protected function init() : void
      {
         var _loc7_:§_-91w§ = null;
         this.x = 12.5;
         this.y = 125;
         var _loc1_:ImageShopClothesBack = new ImageShopClothesBack();
         _loc1_.x = 516;
         _loc1_.y = -5;
         addChildAt(_loc1_,0);
         this.button = new §_-j18§("",80);
         this.button.x = 652;
         this.button.y = 395;
         this.button.addEventListener(MouseEvent.CLICK,this.§_-Hh§);
         addChild(this.button);
         this.§_-zl§ = new §_-22V§("",520,3,new TextFormat(§_-22V§.§_-pJ§,20,6697728));
         addChild(this.§_-zl§);
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < §_-g2W§.§_-fQ§)
         {
            if(§_-g2W§.§_-q1s§(_loc3_) != 0)
            {
               _loc2_.push(_loc3_);
            }
            _loc3_++;
         }
         var _loc4_:Array = [_loc2_,this.§_-w2S§(_loc2_,§_-g2W§.§_-v1b§),this.§_-w2S§(_loc2_,§_-g2W§.§_-g1h§),this.§_-w2S§(_loc2_,§_-g2W§.§_-91o§),this.§_-w2S§(_loc2_,§_-g2W§.§_-k2J§),this.§_-w2S§(_loc2_,§_-g2W§.§_-O2l§),this.§_-w2S§(_loc2_,§_-g2W§.§_-t10§)];
         var _loc5_:Array = [gls("Плащи"),gls("Очки"),gls("Аксессуары в руки"),gls("Ожерелья"),gls("Аксессуары на хвост"),gls("Аксессуары на голову")];
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            _loc7_ = new §_-91w§(§_-Z1M§);
            _loc7_.setData(_loc4_[_loc3_]);
            this.§_-eY§.push(_loc7_);
            _loc3_++;
         }
         this.§_-EE§ = new §_-G2L§();
         this.§_-EE§.x = 10;
         this.§_-EE§.y = -60;
         var _loc6_:§_-F1F§ = new §_-F1F§(new §_-T2z§(gls("Всё"),§_-HM§,ButtonTabShopAll,10));
         new §_-Hb§(_loc6_,gls("Все аксессуары"));
         this.§_-EE§.insert(_loc6_);
         _loc4_ = [ButtonTabShopCloak,ButtonTabShopGlass,ButtonTabShopHands,ButtonTabShopNeck,ButtonTabShopTail,ButtonTabShopHair];
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            _loc6_ = new §_-F1F§(new _loc4_[_loc3_]());
            _loc6_.x = (_loc3_ + 1) * 95;
            this.§_-EE§.insert(_loc6_);
            new §_-Hb§(_loc6_,_loc5_[_loc3_]);
            _loc3_++;
         }
         this.§_-EE§.addEventListener(§_-4Y§.SELECT,this.§_-91N§);
         addChild(this.§_-EE§);
         this.setData(this.§_-eY§[0]);
         this.§_-EE§.§_-vC§(_type);
      }
      
      private function §_-a13§(param1:GameEvent) : void
      {
         this.button.visible = !§_-h1f§.§_-i21§(this.§_-Y1y§.id,§_-h1f§.§_-03X§);
      }
      
      private function §_-91N§(param1:§_-4Y§) : void
      {
         var _loc2_:int = this.§_-EE§.§_-Y2N§.indexOf(param1.button);
         this.setData(this.§_-eY§[_loc2_]);
      }
      
      private function §_-Hh§(param1:MouseEvent) : void
      {
         if(!this.§_-Y1y§)
         {
            return;
         }
         Game.§_-K2t§(§_-h2B§.§_-fM§,§_-g2W§.§_-q1s§(this.§_-Y1y§.id),0,Game.selfId,this.§_-Y1y§.id);
      }
      
      private function §_-w2S§(param1:Array, param2:int) : Array
      {
         var ids:Array = param1;
         var type:int = param2;
         return ids.filter(function(param1:int, param2:int, param3:Array):Boolean
         {
            return §_-g2W§.§_-m1y§(param1) == type;
         });
      }
   }
}

