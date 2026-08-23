package §_-CF§
{
   import §_-I10§.§_-ct§;
   import §_-e1G§.§_-Hb§;
   import §_-vK§.§_-QC§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.AntiAliasType;
   import flash.text.StyleSheet;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.utils.getDefinitionByName;
   import utils.StringUtil;
   import utils.§_-xb§;
   
   public class §_-G1v§ extends Sprite
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #1B120E;","text-align: left;","}",".bold {","font-weight: bold;","text-align: center;","}",".red {","font-size: 10px;","color: #FF0000;","}"].join("\n");
      
      private static const §_-c2T§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,16777215,true,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-Uc§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,3407616,true,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-JI§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,12,16763904,true,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-w1o§:Array = [new GlowFilter(3407616,1,4,4,1.8)];
      
      private static const §_-p16§:Array = [new GlowFilter(16763904,1,4,4,1.8)];
      
      private var data:Object;
      
      private var §_-J2Q§:DisplayObject;
      
      private var button:Sprite;
      
      private var §_-3e§:Boolean;
      
      private var §_-u2W§:BlockedSkillImage;
      
      private var §_-e2Y§:int;
      
      private var §_-73H§:int = 0;
      
      private var §_-w2r§:int = 0;
      
      private var position:int = 0;
      
      private var §_-Wu§:int = 0;
      
      private var §_-M2y§:Sprite;
      
      private var §_-e2e§:§_-22V§;
      
      private var §_-72S§:Shape;
      
      private var bitmapData:BitmapData = null;
      
      private var §_-719§:BitmapData = null;
      
      private var §_-XW§:§_-Hb§;
      
      public function §_-G1v§(param1:int, param2:int, param3:int)
      {
         super();
         this.§_-e2Y§ = param1;
         this.position = param2;
         this.§_-Wu§ = param3;
         this.data = §_-QC§.perkData[param1];
         this.§_-J2Q§ = new PerkOverGlow();
         this.§_-J2Q§.visible = false;
         addChild(this.§_-J2Q§);
         var _loc4_:Sprite = new Sprite();
         var _loc5_:SimpleButton = new this.data["buttonClass"]();
         _loc4_.addChild(_loc5_);
         var _loc6_:BitmapData = new BitmapData(_loc4_.width,_loc4_.height,true,0);
         _loc6_.draw(_loc4_);
         this.button = new Sprite();
         this.button.addChild(new Bitmap(_loc6_));
         this.button.addEventListener(MouseEvent.CLICK,this.§_-r2x§);
         this.button.addEventListener(MouseEvent.MOUSE_OVER,this.§_-Q20§);
         this.button.addEventListener(MouseEvent.MOUSE_OUT,this.§_-9c§);
         addChild(this.button);
         this.§_-u2W§ = new BlockedSkillImage();
         this.§_-u2W§.mouseEnabled = false;
         this.§_-u2W§.mouseChildren = false;
         addChild(this.§_-u2W§);
         this.button.hitArea = this.§_-u2W§;
         this.§_-M2y§ = new Sprite();
         this.§_-M2y§.x = 8;
         this.§_-M2y§.y = 38;
         this.§_-M2y§.graphics.beginFill(4598795);
         this.§_-M2y§.graphics.drawRoundRect(0,0,35,15,15);
         this.§_-M2y§.graphics.endFill();
         this.§_-M2y§.mouseEnabled = false;
         this.§_-M2y§.mouseChildren = false;
         addChild(this.§_-M2y§);
         this.§_-72S§ = new Shape();
         this.§_-72S§.x = 8;
         this.§_-72S§.y = 38;
         this.§_-72S§.graphics.beginFill(16777215,0.5);
         this.§_-72S§.graphics.drawRoundRect(0,0,35,15,15);
         this.§_-72S§.graphics.endFill();
         this.§_-72S§.visible = false;
         addChild(this.§_-72S§);
         this.§_-e2e§ = new §_-22V§("0/6",0,-1,§_-c2T§);
         this.§_-e2e§.width = 35;
         this.§_-e2e§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-e2e§.antiAliasType = AntiAliasType.NORMAL;
         this.§_-M2y§.addChild(this.§_-e2e§);
         var _loc7_:StyleSheet = new StyleSheet();
         _loc7_.parseCSS(§_-I2U§);
         this.§_-XW§ = new §_-Hb§(this,"");
         this.§_-XW§.setStyle(_loc7_);
         this.§_-XW§.maxWidth = 200;
      }
      
      public function get id() : int
      {
         return this.§_-e2Y§;
      }
      
      public function get blocked() : Boolean
      {
         return this.§_-3e§;
      }
      
      public function get §_-A2W§() : String
      {
         var _loc1_:String = "";
         var _loc2_:int = §_-ct§.§_-JN§(this.§_-Wu§,this.position);
         if(§_-ct§.§_-m1k§ != §_-ct§.§_-F2j§ && !§_-ct§.§_-Z1E§(this.§_-Wu§))
         {
            _loc1_ = "<br /><br />" + §_-xb§.span(gls("Чтобы выучить этот навык, купи профессию «{0}».",§_-ct§.§_-t1c§[this.§_-Wu§]),"red");
         }
         else if(§_-ct§.§_-c1x§(this.§_-Wu§) == 0 && _loc2_ <= 0)
         {
            _loc1_ = "<br /><br />" + §_-xb§.span(gls("Недостаточно перьев для изучения навыка."),"red");
         }
         else
         {
            _loc1_ = "<br /><br />" + §_-xb§.span(gls("Вложи ещё {0} {1} в профессию для изучения навыка.",_loc2_.toString(),StringUtil.word("перо",_loc2_)),"red");
         }
         return _loc1_;
      }
      
      public function get §_-p2j§() : BitmapData
      {
         var _loc1_:Sprite = null;
         var _loc2_:SimpleButton = null;
         if(!this.bitmapData)
         {
            _loc1_ = new Sprite();
            _loc2_ = new this.data["buttonClass"]();
            _loc2_.scaleX = _loc2_.scaleY = 1.7;
            _loc1_.addChild(_loc2_);
            this.bitmapData = new BitmapData(_loc1_.width,_loc1_.height,true,0);
            this.bitmapData.draw(_loc1_);
         }
         return this.bitmapData;
      }
      
      public function get §_-R0§() : BitmapData
      {
         var _loc1_:Sprite = null;
         var _loc2_:SimpleButton = null;
         if(!this.§_-719§)
         {
            _loc1_ = new Sprite();
            _loc2_ = new this.data["buttonClass"]();
            _loc2_.scaleX = _loc2_.scaleY = 0.8;
            _loc1_.addChild(_loc2_);
            this.§_-719§ = new BitmapData(_loc1_.width,_loc1_.height,true,0);
            this.§_-719§.draw(_loc1_);
         }
         return this.§_-719§;
      }
      
      public function §_-Q20§(param1:MouseEvent) : void
      {
         this.§_-J2Q§.visible = true;
      }
      
      public function §_-9c§(param1:MouseEvent) : void
      {
         this.§_-J2Q§.visible = false;
      }
      
      public function §_-r2x§(param1:MouseEvent) : void
      {
         if(this.§_-Wu§ != §_-ct§.§_-m1k§ && §_-ct§.§_-m1k§ != §_-ct§.§_-F2j§)
         {
            return;
         }
         §_-ct§.§_-r2x§(this);
      }
      
      public function §_-82§(param1:Boolean) : void
      {
         this.button.mouseChildren = param1;
         this.button.mouseEnabled = param1;
         this.§_-u2W§.visible = param1 ? this.§_-3e§ : true;
         this.§_-72S§.visible = !param1 ? this.§_-M2y§.visible : false;
         if(!param1)
         {
            this.§_-M2y§.filters = null;
         }
      }
      
      public function §_-43I§(param1:Boolean) : void
      {
         this.§_-3e§ = param1;
         this.§_-u2W§.visible = this.§_-3e§;
         this.§_-M2y§.visible = !this.§_-3e§;
         var _loc2_:String = §_-xb§.tag("body") + §_-xb§.span(this.data["name"],"bold") + "<br />" + §_-QC§.§_-03v§(this.id,§_-QC§.§_-l11§,null);
         if(this.§_-3e§)
         {
            _loc2_ += this.§_-A2W§;
         }
         _loc2_ += §_-xb§.§_-p1§("body");
         this.§_-XW§.setStatus(_loc2_);
      }
      
      public function §_-X2t§(param1:int, param2:int) : void
      {
         this.§_-73H§ = param1;
         this.§_-w2r§ = param2;
         if(this.§_-w2r§ > 0 && !§_-ct§.§_-62r§)
         {
            §_-ct§.§_-62r§ = true;
         }
         this.§_-e2e§.text = String(this.§_-73H§ + this.§_-w2r§) + "/" + String(§_-ct§.§_-f1D§);
         if(param1 > 0)
         {
            if(this.§_-73H§ + this.§_-w2r§ == §_-ct§.§_-f1D§)
            {
               this.§_-e2e§.setTextFormat(§_-JI§);
               this.§_-M2y§.filters = §_-p16§;
            }
            else
            {
               this.§_-e2e§.setTextFormat(§_-Uc§);
               this.§_-M2y§.filters = §_-w1o§;
            }
         }
         else
         {
            this.§_-e2e§.setTextFormat(§_-c2T§);
            this.§_-M2y§.filters = null;
         }
      }
      
      public function get §_-w1W§() : int
      {
         return this.§_-73H§;
      }
      
      public function get §_-D24§() : int
      {
         return this.§_-w2r§;
      }
   }
}

