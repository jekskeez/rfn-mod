package starling.textures
{
   import §_-625§.§_-j1b§;
   import flash.display3D.Context3D;
   import flash.display3D.VertexBuffer3D;
   import flash.display3D.textures.TextureBase;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import starling.core.Starling;
   import starling.core.§_-wz§;
   import starling.display.BlendMode;
   import starling.display.DisplayObject;
   import starling.display.§_-I2q§;
   import starling.filters.FragmentFilter;
   import starling.utils.§_-s7§;
   import starling.utils.execute;
   import starling.utils.getNextPowerOfTwo;
   
   public class RenderTexture extends SubTexture
   {
      
      private static var §_-SY§:Rectangle = new Rectangle();
      
      public static var §_-JK§:Boolean = false;
      
      private const §_-73Z§:String = "RenderTexture.supportsNonPotDimensions";
      
      private const §_-X22§:Boolean = true;
      
      private var §_-j6§:Texture;
      
      private var §_-ap§:Texture;
      
      private var §_-Us§:§_-I2q§;
      
      private var §_-JP§:Boolean;
      
      private var §_-a1y§:Boolean;
      
      private var §_-o1L§:Boolean;
      
      private var §_-Q2b§:§_-wz§;
      
      public function RenderTexture(param1:int, param2:int, param3:Boolean = true, param4:Number = -1, param5:String = "bgra", param6:Boolean = false)
      {
         if(param4 <= 0)
         {
            param4 = Starling.§_-Cj§;
         }
         var _loc7_:Number = param1;
         var _loc8_:Number = param2;
         if(!this.supportsNonPotDimensions)
         {
            _loc7_ = getNextPowerOfTwo(param1 * param4) / param4;
            _loc8_ = getNextPowerOfTwo(param2 * param4) / param4;
         }
         this.§_-j6§ = Texture.§_-p2i§(_loc7_,_loc8_,true,false,true,param4,param5,param6);
         this.§_-j6§.root.§_-y1f§ = this.§_-j6§.root.clear;
         super(this.§_-j6§,new Rectangle(0,0,param1,param2),true,null,false);
         var _loc9_:Number = this.§_-j6§.root.width;
         var _loc10_:Number = this.§_-j6§.root.height;
         this.§_-o1L§ = param3;
         this.§_-Q2b§ = new §_-wz§();
         this.§_-Q2b§.§_-L1j§(0,0,_loc9_,_loc10_,param1,param2);
         if(param3 && (!§_-JK§ || !§_-s7§.§_-2Y§))
         {
            this.§_-ap§ = Texture.§_-p2i§(_loc7_,_loc8_,true,false,true,param4,param5,param6);
            this.§_-ap§.root.§_-y1f§ = this.§_-ap§.root.clear;
            this.§_-Us§ = new §_-I2q§(this.§_-ap§);
            this.§_-Us§.smoothing = §_-RS§.NONE;
         }
      }
      
      override public function dispose() : void
      {
         this.§_-Q2b§.dispose();
         this.§_-j6§.dispose();
         if(this.§_-13P§)
         {
            this.§_-ap§.dispose();
            this.§_-Us§.dispose();
         }
         super.dispose();
      }
      
      public function draw(param1:DisplayObject, param2:Matrix = null, param3:Number = 1, param4:int = 0) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.§_-JP§)
         {
            this.render(param1,param2,param3);
         }
         else
         {
            this.§_-qR§(this.render,param1,param2,param3,param4);
         }
      }
      
      public function §_-l1q§(param1:Function, param2:int = 0) : void
      {
         this.§_-qR§(param1,null,null,1,param2);
      }
      
      private function render(param1:DisplayObject, param2:Matrix = null, param3:Number = 1) : void
      {
         var _loc4_:FragmentFilter = param1.filter;
         var _loc5_:DisplayObject = param1.mask;
         this.§_-Q2b§.§_-Sw§();
         this.§_-Q2b§.blendMode = param1.blendMode == BlendMode.AUTO ? BlendMode.NORMAL : param1.blendMode;
         if(param2)
         {
            this.§_-Q2b§.§_-d2I§(param2);
         }
         else
         {
            this.§_-Q2b§.§_-71k§(param1);
         }
         if(_loc5_)
         {
            this.§_-Q2b§.§_-J2n§(_loc5_);
         }
         if(_loc4_)
         {
            _loc4_.render(param1,this.§_-Q2b§,param3);
         }
         else
         {
            param1.render(this.§_-Q2b§,param3);
         }
         if(_loc5_)
         {
            this.§_-Q2b§.§_-UQ§();
         }
      }
      
      private function §_-qR§(param1:Function, param2:DisplayObject = null, param3:Matrix = null, param4:Number = 1, param5:int = 0) : void
      {
         var previousRenderTarget:Texture;
         var tmpTexture:Texture = null;
         var renderBlock:Function = param1;
         var object:DisplayObject = param2;
         var matrix:Matrix = param3;
         var alpha:Number = param4;
         var antiAliasing:int = param5;
         var context:Context3D = Starling.context;
         if(context == null)
         {
            throw new §_-j1b§();
         }
         if(!Starling.§_-n1s§.§_-J1d§)
         {
            return;
         }
         if(this.§_-13P§)
         {
            tmpTexture = this.§_-j6§;
            this.§_-j6§ = this.§_-ap§;
            this.§_-ap§ = tmpTexture;
            this.§_-Us§.texture = this.§_-ap§;
         }
         previousRenderTarget = this.§_-Q2b§.renderTarget;
         §_-SY§.setTo(0,0,this.§_-j6§.width,this.§_-j6§.height);
         this.§_-Q2b§.§_-DM§(§_-SY§);
         this.§_-Q2b§.§_-W2B§(this.§_-j6§,antiAliasing);
         if(this.§_-13P§ || !this.§_-CZ§ || !this.§_-a1y§)
         {
            this.§_-Q2b§.clear();
         }
         if(this.§_-13P§ && this.§_-a1y§)
         {
            this.§_-Us§.render(this.§_-Q2b§,1);
         }
         else
         {
            this.§_-a1y§ = true;
         }
         try
         {
            this.§_-JP§ = true;
            execute(renderBlock,object,matrix,alpha);
         }
         finally
         {
            this.§_-JP§ = false;
            this.§_-Q2b§.§_-z24§();
            this.§_-Q2b§.nextFrame();
            this.§_-Q2b§.renderTarget = previousRenderTarget;
            this.§_-Q2b§.§_-b0§();
         }
      }
      
      public function clear(param1:uint = 0, param2:Number = 0) : void
      {
         if(!Starling.§_-n1s§.§_-J1d§)
         {
            return;
         }
         var _loc3_:Texture = this.§_-Q2b§.renderTarget;
         this.§_-Q2b§.renderTarget = this.§_-j6§;
         this.§_-Q2b§.clear(param1,param2);
         this.§_-Q2b§.renderTarget = _loc3_;
         this.§_-a1y§ = true;
      }
      
      private function get supportsNonPotDimensions() : Boolean
      {
         var texture:TextureBase = null;
         var buffer:VertexBuffer3D = null;
         var target:Starling = Starling.§_-n1s§;
         var context:Context3D = Starling.context;
         var support:Object = target.§_-wx§["RenderTexture.supportsNonPotDimensions"];
         if(support == null)
         {
            if(target.profile != "baselineConstrained" && "createRectangleTexture" in context)
            {
               try
               {
                  texture = context["createRectangleTexture"](2,3,"bgra",true);
                  context.setRenderToTexture(texture);
                  context.clear();
                  context.setRenderToBackBuffer();
                  context.createVertexBuffer(1,1);
                  support = true;
               }
               catch(e:Error)
               {
                  support = false;
               }
               finally
               {
                  if(texture)
                  {
                     texture.dispose();
                  }
                  if(buffer)
                  {
                     buffer.dispose();
                  }
               }
            }
            else
            {
               support = false;
            }
            target.§_-wx§["RenderTexture.supportsNonPotDimensions"] = support;
         }
         return support;
      }
      
      private function get §_-13P§() : Boolean
      {
         return this.§_-ap§ != null;
      }
      
      public function get §_-CZ§() : Boolean
      {
         return this.§_-o1L§;
      }
      
      override public function get base() : TextureBase
      {
         return this.§_-j6§.base;
      }
      
      override public function get root() : §_-72X§
      {
         return this.§_-j6§.root;
      }
   }
}

