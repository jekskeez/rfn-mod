package §_-k1c§
{
   import buttons.§_-j18§;
   import com.api.Services;
   import flash.events.MouseEvent;
   import flash.filters.BevelFilter;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.text.StyleSheet;
   import tape.§_-W18§;
   import utils.§_-xb§;
   
   public class §_-M1v§ extends Dialog
   {
      
      private static var _instance:§_-M1v§;
      
      private static const §_-I2U§:String = ["body","{","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 14px;","color: #000000;","font-weight: bold;","}",".red {","font-family: \"" + §_-22V§.§_-pJ§ + "\";","color: #FF7E3F;","font-size: 23px;","}"].join("\n");
      
      private static const §_-m2A§:Array = [new BevelFilter(1,58,16777215,1,10053120,1,2,2),new GlowFilter(6697728,1,4,4,8),new DropShadowFilter(2,45,0,1,2,2,0.25)];
      
      private var §_-S1k§:§_-W18§;
      
      private var style:StyleSheet;
      
      private var §_-s1z§:Array = [];
      
      public function §_-M1v§()
      {
         super(gls("Пригласи друга"));
         this.init();
      }
      
      public static function show() : void
      {
         if(!_instance)
         {
            _instance = new §_-M1v§();
         }
         _instance.show();
      }
      
      private function init() : void
      {
         var _loc1_:§_-22V§ = null;
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         _loc1_ = new §_-22V§("<body>" + gls("За каждого приглашенного друга, который достигнет {0} уровня, ты получишь",Game.§_-L1O§) + "</body>",5,5,this.style);
         _loc1_.mouseEnabled = false;
         addChild(_loc1_);
         _loc1_ = new §_-22V§("<body>" + §_-xb§.span("+" + Game.§_-Q2m§,"red") + "</body>",_loc1_.x + (_loc1_.textWidth >> 1) - 110,30,this.style);
         _loc1_.mouseEnabled = false;
         _loc1_.filters = §_-m2A§;
         addChild(_loc1_);
         var _loc2_:ImageIconCoins = new ImageIconCoins();
         _loc2_.mouseEnabled = false;
         _loc2_.x = _loc1_.x + _loc1_.textWidth + 5;
         _loc2_.y = 33;
         addChild(_loc2_);
         _loc1_ = new §_-22V§("<body>" + §_-xb§.span(gls("В подарок!"),"red") + "</body>",_loc2_.x + _loc2_.width + 5,30,this.style);
         _loc1_.mouseEnabled = false;
         _loc1_.filters = §_-m2A§;
         addChild(_loc1_);
         this.§_-S1k§ = new §_-W18§();
         this.§_-S1k§.x = 24;
         this.§_-S1k§.y = 70;
         addChild(this.§_-S1k§);
         var _loc3_:§_-j18§ = new §_-j18§(gls("Пригласить"));
         _loc3_.x = 225;
         _loc3_.y = 350;
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-P2v§);
         addChild(_loc3_);
         place();
         this.width = 600;
         this.height = 450;
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-S1k§.§_-WG§();
      }
      
      private function §_-P2v§(param1:MouseEvent) : void
      {
         this.§_-s1z§ = this.§_-S1k§.§_-Lj§().slice();
         this.onComplete();
         hide();
      }
      
      private function onComplete(param1:Object = null) : void
      {
         if(!param1)
         {
         }
         if(this.§_-s1z§.length == 0)
         {
            return;
         }
         Services.inviteFriendsById(this.§_-s1z§.shift());
      }
   }
}

