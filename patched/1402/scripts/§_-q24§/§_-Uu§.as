package §_-q24§
{
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-P2x§;
   import buttons.§_-Hg§;
   import buttons.§_-K2G§;
   import buttons.§_-Q1W§;
   import buttons.§_-uH§;
   import events.GameEvent;
   import events.§_-b2G§;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import protocol.§_-u1O§;
   import tape.§_-2n§;
   import tape.§_-S1M§;
   import tape.§_-h2f§;
   import tape.§_-o2N§;
   import utils.§_-K1Y§;
   import views.§_-v12§;
   
   public class §_-Uu§ extends §_-S1M§
   {
      
      private static const §_-D12§:Array = [new TextFormat(§_-i5§.§_-p1s§,16,8746579),new TextFormat(§_-i5§.§_-p1s§,16,8746579),new TextFormat(§_-i5§.§_-p1s§,16,8746579)];
      
      private static var _instance:§_-Uu§ = null;
      
      private static var _type:int = 0;
      
      private var button:§_-K2G§ = null;
      
      private var §_-S8§:§_-Hg§ = null;
      
      private var §_-Y1T§:§_-i5§ = null;
      
      private var §_-71O§:Array = [];
      
      private var §_-jz§:§_-v12§ = null;
      
      public function §_-Uu§()
      {
         super(4,3,10,5,15,15,110,115,true,true,false);
         _instance = this;
         §_-L1o§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.§_-I13§);
      }
      
      public static function §_-B3L§(param1:int) : void
      {
         if(_instance)
         {
            _instance.§_-S8§.§_-n10§(param1 + 1);
         }
         else
         {
            _type = param1 + 1;
         }
      }
      
      override public function setData(param1:§_-h2f§) : void
      {
         super.setData(param1);
         if(param1.objects.length != 0)
         {
            select(param1.objects[0] as §_-2n§);
         }
         else
         {
            select(null);
         }
      }
      
      override protected function §_-11q§(param1:§_-2n§) : void
      {
         this.button.field.text = §_-P2x§.§_-q2t§(this.§_-02G§.id) + " - ";
         this.button.clear();
         this.button.redraw();
         §_-K1Y§.§_-P2W§(this.button.field,"-",ImageIconCoins,0.7,0.7,-this.button.field.x,-3,false,false);
         this.button.visible = !§_-L1o§.§_-J2p§(this.§_-02G§.id,§_-L1o§.§_-d1W§);
         this.§_-Y1T§.text = §_-P2x§.§_-d1E§(this.§_-02G§.id);
         this.§_-Y1T§.x = 520 + int((340 - this.§_-Y1T§.textWidth) * 0.5);
         if(this.§_-jz§)
         {
            removeChild(this.§_-jz§);
         }
         this.§_-jz§ = new §_-v12§(this.§_-02G§.id);
         this.§_-jz§.x = 540;
         this.§_-jz§.y = 100;
         addChild(this.§_-jz§);
      }
      
      override protected function init() : void
      {
         var _loc7_:§_-o2N§ = null;
         this.x = 12.5;
         this.y = 125;
         var _loc1_:ImageShopClothesBack = new ImageShopClothesBack();
         _loc1_.x = 516;
         _loc1_.y = -5;
         addChildAt(_loc1_,0);
         this.button = new §_-K2G§("",80);
         this.button.x = 652;
         this.button.y = 395;
         this.button.addEventListener(MouseEvent.CLICK,this.§_-k1R§);
         addChild(this.button);
         this.§_-Y1T§ = new §_-i5§("",520,3,new TextFormat(§_-i5§.§_-p1s§,20,6697728));
         addChild(this.§_-Y1T§);
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < §_-P2x§.§_-X1Q§)
         {
            if(§_-P2x§.§_-q2t§(_loc3_) != 0)
            {
               _loc2_.push(_loc3_);
            }
            _loc3_++;
         }
         var _loc4_:Array = [_loc2_,this.§_-Md§(_loc2_,§_-P2x§.§_-w1K§),this.§_-Md§(_loc2_,§_-P2x§.§_-B1R§),this.§_-Md§(_loc2_,§_-P2x§.§_-01k§),this.§_-Md§(_loc2_,§_-P2x§.§_-M2R§),this.§_-Md§(_loc2_,§_-P2x§.§_-z2g§),this.§_-Md§(_loc2_,§_-P2x§.§_-m1o§)];
         var _loc5_:Array = [gls("Плащи"),gls("Очки"),gls("Аксессуары в руки"),gls("Ожерелья"),gls("Аксессуары на хвост"),gls("Аксессуары на голову")];
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            _loc7_ = new §_-o2N§(§_-R2q§);
            _loc7_.setData(_loc4_[_loc3_]);
            this.§_-71O§.push(_loc7_);
            _loc3_++;
         }
         this.§_-S8§ = new §_-Hg§();
         this.§_-S8§.x = 10;
         this.§_-S8§.y = -60;
         var _loc6_:§_-uH§ = new §_-uH§(new §_-Q1W§(gls("Всё"),§_-D12§,ButtonTabShopAll,10));
         new §_-kr§(_loc6_,gls("Все аксессуары"));
         this.§_-S8§.insert(_loc6_);
         _loc4_ = [ButtonTabShopCloak,ButtonTabShopGlass,ButtonTabShopHands,ButtonTabShopNeck,ButtonTabShopTail,ButtonTabShopHair];
         _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            _loc6_ = new §_-uH§(new _loc4_[_loc3_]());
            _loc6_.x = (_loc3_ + 1) * 95;
            this.§_-S8§.insert(_loc6_);
            new §_-kr§(_loc6_,_loc5_[_loc3_]);
            _loc3_++;
         }
         this.§_-S8§.addEventListener(§_-b2G§.SELECT,this.§_-h1u§);
         addChild(this.§_-S8§);
         this.setData(this.§_-71O§[0]);
         this.§_-S8§.§_-n10§(_type);
      }
      
      private function §_-I13§(param1:GameEvent) : void
      {
         this.button.visible = !§_-L1o§.§_-J2p§(this.§_-02G§.id,§_-L1o§.§_-d1W§);
      }
      
      private function §_-h1u§(param1:§_-b2G§) : void
      {
         var _loc2_:int = this.§_-S8§.§_-a3§.indexOf(param1.button);
         this.setData(this.§_-71O§[_loc2_]);
      }
      
      private function §_-k1R§(param1:MouseEvent) : void
      {
         if(!this.§_-02G§)
         {
            return;
         }
         Game.§_-u2z§(§_-u1O§.§_-C1c§,§_-P2x§.§_-q2t§(this.§_-02G§.id),0,Game.selfId,this.§_-02G§.id);
      }
      
      private function §_-Md§(param1:Array, param2:int) : Array
      {
         var ids:Array = param1;
         var type:int = param2;
         return ids.filter(function(param1:int, param2:int, param3:Array):Boolean
         {
            return §_-P2x§.§_-01x§(param1) == type;
         });
      }
   }
}

