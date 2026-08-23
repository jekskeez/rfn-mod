package §_-bN§
{
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-N10§;
   import §_-X1k§.§_-XW§;
   import §_-c2C§.§_-gc§;
   import §_-c2C§.§_-t2c§;
   import buttons.§_-K2G§;
   import com.api.Services;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import tape.§_-73X§;
   
   public class §_-OB§ extends Dialog
   {
      
      private static const §_-17§:int = 180;
      
      private static var _instance:§_-OB§ = null;
      
      private static var time:int = 0;
      
      private static var §_-p2j§:Boolean = false;
      
      private var §_-I2m§:§_-73X§;
      
      private var §_-7V§:Array = [];
      
      public function §_-OB§()
      {
         super(gls("Заскучали?"));
         this.init();
      }
      
      public static function init() : void
      {
         if(§_-LZ§.§_-mA§ <= §_-XW§.§_-I1V§ || Game.self.type == §_-Zy§.§_-nn§)
         {
            return;
         }
         if(!Game.§_-dj§ || Game.§_-dj§.length == 0 || Game.§_-dj§.length == Game.§_-d1o§.length)
         {
            return;
         }
         §_-p1V§.§_-63T§(§_-62z§);
         Game.stage.addEventListener(MouseEvent.CLICK,§_-w1g§);
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,§_-w1g§);
      }
      
      private static function §_-62z§() : void
      {
         if(Boolean(_instance) && Boolean(_instance.visible) || §_-p2j§)
         {
            return;
         }
         ++time;
         if(time < §_-17§)
         {
            return;
         }
         if(§_-t2c§.active is §_-gc§)
         {
            §_-p1V§.§_-B3x§(§_-62z§);
            return;
         }
         if(!_instance)
         {
            _instance = new §_-OB§();
         }
         if(!_instance.visible)
         {
            _instance.show();
         }
         §_-N10§.§_-p2j§(§_-N10§.§_-4N§);
         §_-p2j§ = true;
      }
      
      private static function §_-w1g§(param1:Event = null) : void
      {
         time = 0;
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-I2m§.§_-W1L§();
      }
      
      private function init() : void
      {
         addChild(new §_-i5§(gls("Пригласи нас в игру, будем играть вместе!"),5,0,new TextFormat(null,14,0)));
         addChild(new §_-i5§(gls("За каждого приглашенного друга, который\nдостигнет {0} уровня, ты получишь",Game.§_-Bq§),§_-Zy§.§_-BI§ ? 35 : 72,90,new TextFormat(null,11,0,null,null,null,null,null,"center")));
         addChild(new §_-i5§(gls("+15      в подарок"),§_-Zy§.§_-BI§ ? 52 : 68,120,new TextFormat(§_-i5§.§_-p1s§,20,16743999))).filters = §_-Sg§.§_-13A§;
         var _loc1_:ImageIconCoins = new ImageIconCoins();
         _loc1_.x = §_-Zy§.§_-BI§ ? 95 : 111;
         _loc1_.y = 120;
         addChild(_loc1_);
         this.§_-I2m§ = new §_-73X§(true);
         this.§_-I2m§.y = 25;
         addChild(this.§_-I2m§);
         var _loc2_:§_-K2G§ = new §_-K2G§(gls("Пригласить"));
         _loc2_.x = §_-Zy§.§_-BI§ ? 80 : 110;
         _loc2_.y = 150;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-H1h§);
         addChild(_loc2_);
         place();
         this.width = 330;
         this.height = 235;
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         this.§_-7V§ = this.§_-I2m§.§_-D1G§().slice();
         this.onComplete();
         §_-N10§.used(§_-N10§.§_-4N§);
         hide();
      }
      
      private function onComplete(param1:Object = null) : void
      {
         if(this.§_-7V§.length == 0)
         {
            return;
         }
         Services.inviteFriendsById(this.§_-7V§.shift());
      }
   }
}

