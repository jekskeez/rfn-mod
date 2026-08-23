package §_-bN§
{
   import buttons.§_-K2G§;
   import com.api.Services;
   import flash.events.MouseEvent;
   import flash.filters.BevelFilter;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.text.StyleSheet;
   import tape.§_-73X§;
   import utils.§_-r1G§;
   
   public class §_-Jp§ extends Dialog
   {
      
      private static var _instance:§_-Jp§;
      
      private static const §_-aD§:String = ["body","{","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 14px;","color: #000000;","font-weight: bold;","}",".red {","font-family: \"" + §_-i5§.§_-p1s§ + "\";","color: #FF7E3F;","font-size: 23px;","}"].join("\n");
      
      private static const §_-q2I§:Array = [new BevelFilter(1,58,16777215,1,10053120,1,2,2),new GlowFilter(6697728,1,4,4,8),new DropShadowFilter(2,45,0,1,2,2,0.25)];
      
      private var §_-I2m§:§_-73X§;
      
      private var style:StyleSheet;
      
      private var §_-7V§:Array = [];
      
      public function §_-Jp§()
      {
         super(gls("Пригласи друга"));
         this.init();
      }
      
      public static function show() : void
      {
         if(!_instance)
         {
            _instance = new §_-Jp§();
         }
         _instance.show();
      }
      
      private function init() : void
      {
         var _loc1_:§_-i5§ = null;
         this.style = new StyleSheet();
         this.style.parseCSS(§_-aD§);
         _loc1_ = new §_-i5§("<body>" + gls("За каждого приглашенного друга, который достигнет {0} уровня, ты получишь",Game.§_-Bq§) + "</body>",5,5,this.style);
         _loc1_.mouseEnabled = false;
         addChild(_loc1_);
         _loc1_ = new §_-i5§("<body>" + §_-r1G§.span("+" + Game.§_-n1I§,"red") + "</body>",_loc1_.x + (_loc1_.textWidth >> 1) - 110,30,this.style);
         _loc1_.mouseEnabled = false;
         _loc1_.filters = §_-q2I§;
         addChild(_loc1_);
         var _loc2_:ImageIconCoins = new ImageIconCoins();
         _loc2_.mouseEnabled = false;
         _loc2_.x = _loc1_.x + _loc1_.textWidth + 5;
         _loc2_.y = 33;
         addChild(_loc2_);
         _loc1_ = new §_-i5§("<body>" + §_-r1G§.span(gls("В подарок!"),"red") + "</body>",_loc2_.x + _loc2_.width + 5,30,this.style);
         _loc1_.mouseEnabled = false;
         _loc1_.filters = §_-q2I§;
         addChild(_loc1_);
         this.§_-I2m§ = new §_-73X§();
         this.§_-I2m§.x = 24;
         this.§_-I2m§.y = 70;
         addChild(this.§_-I2m§);
         var _loc3_:§_-K2G§ = new §_-K2G§(gls("Пригласить"));
         _loc3_.x = 225;
         _loc3_.y = 350;
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
         addChild(_loc3_);
         place();
         this.width = 600;
         this.height = 450;
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-I2m§.§_-W1L§();
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         this.§_-7V§ = this.§_-I2m§.§_-D1G§().slice();
         this.onComplete();
         hide();
      }
      
      private function onComplete(param1:Object = null) : void
      {
         if(!param1)
         {
         }
         if(this.§_-7V§.length == 0)
         {
            return;
         }
         Services.inviteFriendsById(this.§_-7V§.shift());
      }
   }
}

