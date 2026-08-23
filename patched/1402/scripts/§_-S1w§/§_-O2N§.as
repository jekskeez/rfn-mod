package §_-S1w§
{
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-4v§;
   import §_-o10§.§_-pl§;
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
   import utils.§_-r1G§;
   
   public class §_-O2N§ extends Sprite
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #1B120E;","text-align: left;","}",".bold {","font-weight: bold;","text-align: center;","}",".red {","font-size: 10px;","color: #FF0000;","}"].join("\n");
      
      private static const §_-V1Z§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,16777215,true,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-m2w§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,3407616,true,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-911§:TextFormat = new TextFormat(§_-i5§.§_-c10§,12,16763904,true,null,null,null,null,TextFormatAlign.CENTER);
      
      private static const §_-tR§:Array = [new GlowFilter(3407616,1,4,4,1.8)];
      
      private static const §_-M2§:Array = [new GlowFilter(16763904,1,4,4,1.8)];
      
      private var data:Object;
      
      private var §_-31m§:DisplayObject;
      
      private var button:Sprite;
      
      private var §_-l1M§:Boolean;
      
      private var §_-617§:BlockedSkillImage;
      
      private var §_-437§:int;
      
      private var §_-32v§:int = 0;
      
      private var §_-mW§:int = 0;
      
      private var position:int = 0;
      
      private var §_-c1i§:int = 0;
      
      private var §_-21J§:Sprite;
      
      private var §_-72y§:§_-i5§;
      
      private var §_-T1h§:Shape;
      
      private var bitmapData:BitmapData = null;
      
      private var §_-B3P§:BitmapData = null;
      
      private var §_-oj§:§_-kr§;
      
      public function §_-O2N§(param1:int, param2:int, param3:int)
      {
         super();
         this.§_-437§ = param1;
         this.position = param2;
         this.§_-c1i§ = param3;
         this.data = §_-pl§.perkData[param1];
         this.§_-31m§ = new PerkOverGlow();
         this.§_-31m§.visible = false;
         addChild(this.§_-31m§);
         var _loc4_:Sprite = new Sprite();
         var _loc5_:SimpleButton = new this.data["buttonClass"]();
         _loc4_.addChild(_loc5_);
         var _loc6_:BitmapData = new BitmapData(_loc4_.width,_loc4_.height,true,0);
         _loc6_.draw(_loc4_);
         this.button = new Sprite();
         this.button.addChild(new Bitmap(_loc6_));
         this.button.addEventListener(MouseEvent.CLICK,this.§_-B1h§);
         this.button.addEventListener(MouseEvent.MOUSE_OVER,this.§_-T2H§);
         this.button.addEventListener(MouseEvent.MOUSE_OUT,this.§_-k2s§);
         addChild(this.button);
         this.§_-617§ = new BlockedSkillImage();
         this.§_-617§.mouseEnabled = false;
         this.§_-617§.mouseChildren = false;
         addChild(this.§_-617§);
         this.button.hitArea = this.§_-617§;
         this.§_-21J§ = new Sprite();
         this.§_-21J§.x = 8;
         this.§_-21J§.y = 38;
         this.§_-21J§.graphics.beginFill(4598795);
         this.§_-21J§.graphics.drawRoundRect(0,0,35,15,15);
         this.§_-21J§.graphics.endFill();
         this.§_-21J§.mouseEnabled = false;
         this.§_-21J§.mouseChildren = false;
         addChild(this.§_-21J§);
         this.§_-T1h§ = new Shape();
         this.§_-T1h§.x = 8;
         this.§_-T1h§.y = 38;
         this.§_-T1h§.graphics.beginFill(16777215,0.5);
         this.§_-T1h§.graphics.drawRoundRect(0,0,35,15,15);
         this.§_-T1h§.graphics.endFill();
         this.§_-T1h§.visible = false;
         addChild(this.§_-T1h§);
         this.§_-72y§ = new §_-i5§("0/6",0,-1,§_-V1Z§);
         this.§_-72y§.width = 35;
         this.§_-72y§.autoSize = TextFieldAutoSize.CENTER;
         this.§_-72y§.antiAliasType = AntiAliasType.NORMAL;
         this.§_-21J§.addChild(this.§_-72y§);
         var _loc7_:StyleSheet = new StyleSheet();
         _loc7_.parseCSS(§_-aD§);
         this.§_-oj§ = new §_-kr§(this,"");
         this.§_-oj§.setStyle(_loc7_);
         this.§_-oj§.maxWidth = 200;
      }
      
      public function get id() : int
      {
         return this.§_-437§;
      }
      
      public function get blocked() : Boolean
      {
         return this.§_-l1M§;
      }
      
      public function get §_-92U§() : String
      {
         var _loc1_:String = "";
         var _loc2_:int = §_-4v§.§_-53u§(this.§_-c1i§,this.position);
         if(§_-4v§.§_-71M§ != §_-4v§.§_-631§ && !§_-4v§.§_-p21§(this.§_-c1i§))
         {
            _loc1_ = "<br /><br />" + §_-r1G§.span(gls("Чтобы выучить этот навык, купи профессию «{0}».",§_-4v§.§_-za§[this.§_-c1i§]),"red");
         }
         else if(§_-4v§.§_-A3U§(this.§_-c1i§) == 0 && _loc2_ <= 0)
         {
            _loc1_ = "<br /><br />" + §_-r1G§.span(gls("Недостаточно перьев для изучения навыка."),"red");
         }
         else
         {
            _loc1_ = "<br /><br />" + §_-r1G§.span(gls("Вложи ещё {0} {1} в профессию для изучения навыка.",_loc2_.toString(),StringUtil.word("перо",_loc2_)),"red");
         }
         return _loc1_;
      }
      
      public function get §_-u1a§() : BitmapData
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
      
      public function get §_-M2e§() : BitmapData
      {
         var _loc1_:Sprite = null;
         var _loc2_:SimpleButton = null;
         if(!this.§_-B3P§)
         {
            _loc1_ = new Sprite();
            _loc2_ = new this.data["buttonClass"]();
            _loc2_.scaleX = _loc2_.scaleY = 0.8;
            _loc1_.addChild(_loc2_);
            this.§_-B3P§ = new BitmapData(_loc1_.width,_loc1_.height,true,0);
            this.§_-B3P§.draw(_loc1_);
         }
         return this.§_-B3P§;
      }
      
      public function §_-T2H§(param1:MouseEvent) : void
      {
         this.§_-31m§.visible = true;
      }
      
      public function §_-k2s§(param1:MouseEvent) : void
      {
         this.§_-31m§.visible = false;
      }
      
      public function §_-B1h§(param1:MouseEvent) : void
      {
         if(this.§_-c1i§ != §_-4v§.§_-71M§ && §_-4v§.§_-71M§ != §_-4v§.§_-631§)
         {
            return;
         }
         §_-4v§.§_-B1h§(this);
      }
      
      public function §_-X1U§(param1:Boolean) : void
      {
         this.button.mouseChildren = param1;
         this.button.mouseEnabled = param1;
         this.§_-617§.visible = param1 ? this.§_-l1M§ : true;
         this.§_-T1h§.visible = !param1 ? this.§_-21J§.visible : false;
         if(!param1)
         {
            this.§_-21J§.filters = null;
         }
      }
      
      public function §_-4S§(param1:Boolean) : void
      {
         this.§_-l1M§ = param1;
         this.§_-617§.visible = this.§_-l1M§;
         this.§_-21J§.visible = !this.§_-l1M§;
         var _loc2_:String = §_-r1G§.tag("body") + §_-r1G§.span(this.data["name"],"bold") + "<br />" + §_-pl§.§_-O2e§(this.id,§_-pl§.§_-61Z§,null);
         if(this.§_-l1M§)
         {
            _loc2_ += this.§_-92U§;
         }
         _loc2_ += §_-r1G§.§_-43A§("body");
         this.§_-oj§.setStatus(_loc2_);
      }
      
      public function §_-nu§(param1:int, param2:int) : void
      {
         this.§_-32v§ = param1;
         this.§_-mW§ = param2;
         if(this.§_-mW§ > 0 && !§_-4v§.§_-71p§)
         {
            §_-4v§.§_-71p§ = true;
         }
         this.§_-72y§.text = String(this.§_-32v§ + this.§_-mW§) + "/" + String(§_-4v§.§_-v1K§);
         if(param1 > 0)
         {
            if(this.§_-32v§ + this.§_-mW§ == §_-4v§.§_-v1K§)
            {
               this.§_-72y§.setTextFormat(§_-911§);
               this.§_-21J§.filters = §_-M2§;
            }
            else
            {
               this.§_-72y§.setTextFormat(§_-m2w§);
               this.§_-21J§.filters = §_-tR§;
            }
         }
         else
         {
            this.§_-72y§.setTextFormat(§_-V1Z§);
            this.§_-21J§.filters = null;
         }
      }
      
      public function get §_-43U§() : int
      {
         return this.§_-32v§;
      }
      
      public function get §_-X2I§() : int
      {
         return this.§_-mW§;
      }
   }
}

