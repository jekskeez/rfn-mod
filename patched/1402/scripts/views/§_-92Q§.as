package views
{
   import §_-I18§.§_-Tw§;
   import §_-U19§.Clan;
   import §_-U19§.§_-B2U§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import protocol.§_-s2l§;
   import utils.§_-L2J§;
   
   public class §_-92Q§ extends Sprite
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 14px;","color: #ffffff;","font-weight: bold;","}","a {","text-decoration: none;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private var §_-b19§:Clan = null;
      
      private var §_-EC§:§_-i5§;
      
      private var clanEmblem:§_-SZ§;
      
      public function §_-92Q§()
      {
         super();
         this.init();
      }
      
      public function set clanId(param1:int) : void
      {
         if(this.§_-b19§ != null)
         {
            this.§_-b19§.removeEventListener(this.onClanLoaded);
            this.§_-b19§ = null;
         }
         if(param1 == 0)
         {
            this.visible = false;
            return;
         }
         this.§_-b19§ = §_-B2U§.§_-Q2g§(param1);
         this.§_-b19§.addEventListener(§_-eT§.§_-P26§,this.onClanLoaded);
         §_-B2U§.request(param1,§_-eT§.§_-P26§,false);
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         var _loc2_:DisplayObject = new ButtonClan().upState;
         _loc2_.x = 30;
         _loc2_.y = 10;
         addChild(_loc2_);
         this.§_-EC§ = new §_-i5§("",75,0,_loc1_);
         this.§_-EC§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-H1h§);
         addChild(this.§_-EC§);
         this.clanEmblem = new §_-SZ§("",52,2,20);
         addChild(this.clanEmblem);
      }
      
      private function onClanLoaded(param1:Clan, param2:uint) : void
      {
         if(Boolean(param2) && Boolean(param1))
         {
         }
         this.visible = this.§_-b19§.state == §_-s2l§.§_-YU§;
         if(this.§_-b19§.state != §_-s2l§.§_-YU§)
         {
            return;
         }
         §_-L2J§.§_-CS§(this.§_-EC§,this.§_-b19§.name,130,true,true,this.§_-b19§.id);
         this.clanEmblem.load(this.§_-b19§.§_-51L§);
      }
      
      private function §_-H1h§(param1:MouseEvent) : void
      {
         §_-Tw§.show(this.§_-b19§.id);
      }
   }
}

